
require 'tilt'
require 'temple/utils'


module Laydown

  DEFAULT_TEMPLATE = {
    :charset      => 'utf-8',
    :title        => nil,
    :description  => nil,
    :favicon      => nil,
    :keywords     => nil,
    :css          => [],
    :js           => [],
    :inline_js    => [],
    :head         => [],
    :body_class   => nil,
    :body         => '#{yield}',
    :ga_code      => nil
  }

  def self.compile(template={})

    template = DEFAULT_TEMPLATE.merge(template)

    [:charset, :title, :description, :favicon,
    :keywords, :body_class, :body, :ga_code
    ].each do |k|
      template[k] = case template[k]
        when Array  then template[k].join(template[k] == :keywords ? ', ' : '')
        when String then template[k]
        else template[k].to_s
      end
    end

    [:css, :js, :inline_js, :head].each do |k|
      template[k] = Array(template[k]).flatten.compact
    end

    compiled = read_raw_template.gsub(/data\[:([a-zA-Z0-9_]+)\]/) do |m|
      val = template[:"#{$1}"]
      case val
        when String then interpolatize(val)
        when nil    then 'nil'
        when Array  then interpolatize(
          val.map {|v| v.to_s }
          )
        else val.to_s
      end
    end

    puts compiled
    compiled
  end

  def self.new(hsh={})
    Template.new(hsh)
  end

  def self.read_raw_template
    File.read(File.join(
      File.dirname(__FILE__), 'template.rb'
      ))
  end

  def self.interpolatize(obj)
    puts obj
    obj.inspect.gsub(/\\#\{/, '#{')
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
end


