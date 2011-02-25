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

Quick HTML5 layouts.

    # $ gem install laydown

&nbsp;

    require 'laydown'

    layout = Laydown.new(
      charset:      'utf-8' # default
      title:        'A man in a #{@where}',
      description:  'Very interesting',
      favicon:      'pill.png',
      keywords:     ['man', :@keywords],

      css:          ['site.css', :@css],
      js:           ['app.js', :@js],
      inline_js:    ['alert("#{@msg}");'],

      head:         '<meta soundtrack="Piazzolla">',
      body:         :yield, # default
      body_class:   ['dark', :@body_class],
      ga_code:      'google_analytics_id'
      )

    # ----------------------------

    @where    = 'cave'
    @keywords = 'cave, interesting'
    @css      = 'somesheet.css'

    layout.render(self, :msg => 'hello') { '<p>body text</p>' }
    # => your html5 layout

### Features

* Fast
* Small footprint
* Built on Temple and Tilt

### Copyright

Copyright (c) 2011 Jostein Berre Eliassen.
See LICENCE for details. (MIT licence)
