
require 'backports'


module Laydown
  TOPOBJECT = defined?(BasicObject) ? BasicObject : Object

  def self.new(&blk)
    Template.new(&blk)
  end

  class Template
    def initialize(&blk)
      @layout = blk
    end

    def render(scope=Object.new, &blk)
      dsl = ::Laydown::DSL.new
      scope.instance_exec(dsl, &@layout)
      Renderer.new(dsl._captured_values, &blk).render
    end
  end

  class DSL
    TARGETS = %w{
      charset lang title description favicon keywords css js
      inline_js head body ga_code body_class
      }

    attr_reader :_captured_values

    def initialize
      @_captured_values = Hash.new { [] }
    end

    def _laydown(name, *values)
      @_captured_values[name] += values
    end

    TARGETS.each do |name|
      class_eval <<-RUBY
        def #{name}(*a); _laydown('#{name}', *a); end
      RUBY
    end
  end

  class Renderer

    def initialize(v)

      @charset      = v['charset'].first || 'utf-8'
      @lang         = v['lang'].first
      @title        = v['title'].compact.join(' &ndash; ')
      @favicon      = v['favicon'].first
      @description  = v['description'].compact.join(' ') if v['description']
      @keywords     = v['keywords'].compact.join(', ') if v['keywords']
      @css          = v['css'].compact
      @js           = v['js'].compact
      @inline_js    = v['inline_js'].compact
      @head         = v['head'].compact.join("\n")
      @ga_code      = v['ga_code'].first
      @body_class   = v['body_class'].compact.join(' ') if v['body_class']
      @body = [block_given? ? yield : nil, v['body']].
                      flatten.compact.join("\n")
    end

    def render
      "<!DOCTYPE html>\n" +
      _(:html, {:lang => @lang},
        _(:head, {},
          _(:meta, {:charset => @charset}) +
          _(:title, {}, @title) +
          (@favicon ?
            _(:link, {:rel => 'shortcut icon', :href => @favicon}) : '') +
          (@description ?
            _(:meta, {:description => @description}) : '') +
          (@keywords ?
            _(:meta, {:keywords => @keywords}) : '') +
          @css.map do |url|
            _(:link, {:rel => :stylesheet, :type => 'text/css', :href => url})
          end.join +
          @js.map do |url|
            _(:script, {:type => 'text/javascript', :src => url}, '')
          end.join +
          @inline_js.map do |code|
            _(:script, {:type => 'text/javascript'}, code)
          end.join +
          (@ga_code ? google_analytics_js : '') +
          @head
        ) +
        _(:body, {:class => @body_class},
          @body
        )
      )
    end


    # html helpers

    def _(name, props={}, contents=nil)
      tag_str = name.to_s + prop_str(props)
      if contents
        "<#{tag_str}>\n#{contents}\n</#{name}>\n"
      else
        "<#{tag_str}/>\n"
      end
    end

    def prop_str(hsh)
      return '' if hsh.values.compact.empty?
      ' ' + hsh.map do |k,v|
        "#{k.to_s}='#{v.to_s}'" if v
      end.compact.join(' ')
    end

    def google_analytics_js
    <<-JS
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '#{@ga_code}']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
    JS
    end

  end
end

