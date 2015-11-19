# PixelPad

Upload images and display them on a [Launchpad](http://www.ableton-live-expert.com/wp-content/uploads/2015/01/IMG_8143.jpg)

This necessarily has to run locally (and you need a Launchpad Pro) -

    $ bundle install
    $ rake db:setup
    $ foreman start

Take a look at `lib/launchpad.rb` if this isn't auto-finding your device.
