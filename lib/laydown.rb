
require 'tilt'
require 'temple/utils'


module Laydown

  RAW_TEMPLATE = File.read(File.join(
    File.dirname(__FILE__), 'template.rb'
    ))

  DEFAULT_TEMPLATE = {
    :charset      => 'utf-8',
    :title        => nil,
    :description  => nil,
    :favicon      => nil,
    :keywords     => [],
    :css          => [],
    :js           => [],
    :inline_js    => [],
    :head         => [],
    :body_class   => [],
    :body         => :yield,
    :ga_code      => :@ga_code
  }

  ARRAY_PROPS = [:keywords, :css, :js, :inline_js, :head, :body_class]

  def self.compile(template={})

    template = DEFAULT_TEMPLATE.merge(template)

    ARRAY_PROPS.each do |k|
      template[k] = Array(template[k]).flatten.compact
    end

    RAW_TEMPLATE.gsub(/data\[:([a-zA-Z0-9_]+)\]/) do |m|
      literalize template[:"#{$1}"]
    end
  end

  def self.literalize(obj)
    case obj
      when String then obj.inspect.gsub(/\\#\{/, '#{') + "+''"
      when Symbol then obj.to_s
      when nil    then 'nil'
      when Array
        '[' + obj.map {|o| literalize(o) }.join(', ') + ']'
      else obj.to_s.inspect
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


