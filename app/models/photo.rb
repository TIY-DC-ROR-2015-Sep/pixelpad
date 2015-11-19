class Photo < ActiveRecord::Base
  mount_uploader :image, PhotoUploader

  def pixel_grid
    return @_pixel_grid if @_pixel_grid

    grid = []
    bmp = Magick::Image.read(image.versions[:pixels].path).first
    bmp.each_pixel do |p, col, row|
      grid[row] ||= []
      grid[row][col] = p
    end

    @_pixel_grid = grid
  end

  def bitmap
    pixel_grid.map do |row|
      row.map do |p|
        [p.red, p.green, p.blue].map do |v|
          scaled = (v * 63.0) / (2 ** 16)
          scaled.round(0)
        end
      end
    end
  end

  def render_bitmap!
    Launchpad::RenderJob.perform_async bitmap
  end
  def self.reset!
    bitmap = 8.times.map do
      8.times.map do
        [0,0,0]
      end
    end
    Launchpad::RenderJob.perform_async bitmap
  end
end
