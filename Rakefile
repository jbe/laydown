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
    gem.add_dependency "instant_dsl", ">= 0"
    gem.add_development_dependency "tenjin", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

namespace :build do
  desc 'Builds Tenjin templates'
  task :templates do
    sh 'rbtenjin -s templates/default_layout.tenjin.html > lib/templates/default_layout.rb'
  end
end
