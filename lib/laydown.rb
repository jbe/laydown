
require 'tilt'
require 'temple/utils'


module Laydown

  require 'laydown/template'

  DEFAULTS = {
    :charset      => 'utf-8',
    :title        => '#{@title}',
    :description  => nil,
    :favicon      => nil,
    :keywords     => [:@keywords],
    :css          => [:@css, :@stylesheets],
    :js           => [:@javascripts, :@js],
    :inline_js    => [:@inline_js],
    :head         => [],
    :body_class   => [],
    :body         => :yield,
    :ga_code      => :@ga_code
  }

  class << self

    def properties
      DEFAULTS.keys
    end

    def plural_properties
      properties.select {|name| DEFAULTS[name].is_a?(Array) }
    end

    def compile(values={})
      process(values)
      validate(values)
      make_template_from(values)
    end

    def process(values)
      DEFAULTS.each {|k,v| values[k] ||= v }
      plural_properties.each do |k|
        values[k] = Array(values[k]).flatten.compact
      end
    end

    def validate(values)
      values.keys.each do |value|
        unless DEFAULTS.keys.include?(value)
          raise "no Laydown property called #{value.inspect}"
        end
      end
    end

    def make_template_from(values)
      TEMPLATE.gsub(/data\[:([a-zA-Z0-9_]+)\]/) do |m|
        literalize values[:"#{$1}"]
      end
    end

    def literalize(obj)
      case obj
        when String then obj.inspect.gsub(/\\#\{/, '#{') + "+''"
        when Symbol then obj.to_s
        when nil    then 'nil'
        when Array
          '[' + obj.map {|o| literalize(o) }.join(', ') + ']'
        else obj.to_s.inspect
      end
    end

  end

  class Template < Tilt::Template

    def initialize(hsh)
      super(nil, 1, hsh) { '' } # tilt hack
    end

    def prepare
      @src = Laydown.compile(options)
    end

    def precompiled_template(locals)
      @src
    end
  end

  def self.new(hsh={})
    Template.new(hsh)
  end
end


