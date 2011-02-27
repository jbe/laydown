require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "laydown"
    gem.summary = %Q{Make HTML5 layouts quickly with plain Ruby.}
    gem.description = %Q{Provides a simple Ruby DSL for defining HTML5 layouts for web apps. For those who has written the same layout too many times.}
    gem.email = "post@jostein.be"
    gem.homepage = "http://github.com/jbe/laydown"
    gem.authors = ["jbe"]
    gem.add_dependency "temple" #, ">= 0"
    gem.add_dependency "tilt" #, ">= 0"
    gem.add_development_dependency "slim", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

namespace :build do
  desc 'Builds slim template'
  task :template do
    require 'slim'
    src = File.read('template.slim')
    engine = Slim::Engine.new()
    compiled = engine.compile(src)

    File.open('lib/laydown/template.rb', 'w') do |f|
      f.write "Laydown::TEMPLATE = <<'TEMPLATE'\n"
      f.write compiled
      f.write "\nTEMPLATE\n"
    end
  end
end
