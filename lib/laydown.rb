
require 'markaby'
require 'instant_dsl'

module Laydown

  DSL_WORDS = [:title, :description, :favicon, :keywords, :css, :js, :body]
  DSL = InstantDSL[*DSL_WORDS]

  class NoScope < Object; end

  class TemplateScope
    def initialize(v)
      @title        = v[:title].join
      @description  = v[:description].join
      @favicon      = v[:favicon].first
      @keywords     = v[:keywords].join(', ')
      @stylesheets  = v[:css].compact
      @javascripts  = v[:js].compact
      @body         = v[:body].join("\n")
    end
  end

  def self.layout(&conf)
    Template.new(&conf)
  end

  class Template
    def initialize(&conf)
      @conf = conf
      @tpath = File.expand_path('../templates/default_layout.rb', __FILE__)
      @template = IO.read(@tpath)
    end

    def render(source_scope=::Laydown::NoScope.new)
      dsl_scope = ::Laydown::DSL.new(source_scope)

      dsl_scope.send :instance_eval, &@conf

      scope = ::Laydown::TemplateScope.new(dsl_scope.dsl_values)
      scope.send :instance_eval, @template, @tpath
    end

  end

end









