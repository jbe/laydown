    #
    #                            «=»
    #                             ^
    #                      $  «« ^¨^ »»  $
    #                           '' ''
    #        .
    #       «=»
    #        ^
    #    «« ^¨^ »»
    #     LAYDOWN
    #     ''|'|''
    #       | |                  |>
    #       | |            ______|_
    #       | |           | oo     |
    #'''''''''''''''''''''''''''''******

Laydown is a simple template language for defining quick HTML5 layouts in Ruby. Never write the same old boilerplate again.

    # $ gem install laydown

&nbsp;

    require 'laydown'

    layout = Laydown.new do |_|
      _.charset 'some crazy charset'
      _.title 'A man in a cave'
      _.description 'A man is sitting in a cave.'
      _.keywords 'man, cave, mystery', @keywords
      _.favicon '/maninacave.png'
      _.css '/maninacave/style.css'
      _.css @css, '/site.css'
      _.js @js
      _.inline_js 'alert("Grrr");'
      _.head '<meta generator="FlushFlox Super Deluxe">'
      _.ga_code 'UA-8079526-5' # google analytics
      _.body_class @body_class
    end

    @css        = 'somesheet.css'
    @body_class = 'front'

    layout.render(self) { '<p>this comes in the body</p>' }
    # => your html5 layout

The block given to `Laydown.new` will be evaluated in the context passed to the `render` method.

