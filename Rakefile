require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "laydown"
    gem.summary = %Q{Pure Ruby HTML5 layout DSL for microframeworks.}
    gem.description = %Q{Provides a simple Ruby DSL for defining HTML5 layouts for web apps. For those of us who has written basically the same html head 200 times and feels like minimalism.}
    gem.email = "post@jostein.be"
    gem.homepage = "http://github.com/jbe/laydown"
    gem.authors = ["jbe"]
    gem.add_dependency "backports" #, ">= 0"
    gem.add_development_dependency "tenjin", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

namespace :build do
  desc 'Builds Tenjin templates'
  task :template do

    require 'haml'
    src = File.read('template/default.haml')
    compiled = Haml::Engine.new(src).precompiled
    File.open('lib/laydown/template.rb', 'w') do |f|
      f.write <<-RUBY
        require 'haml'
        #require 'haml/helpers'
        #require 'haml/util'
        #require 'haml/buffer'
        extend Haml::Helpers
        _hamlout = @haml_buffer = Haml::Buffer.new(@haml_buffer)
      RUBY
      f.write(compiled)
      f.write "@haml_buffer = @haml_buffer.upper"
    end

    #sh 'rbtenjin -s templates/default_layout.tenjin.html > lib/templates/default_layout.rb'
  end
end
