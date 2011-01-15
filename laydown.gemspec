# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{laydown}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jbe"]
  s.date = %q{2011-01-15}
  s.description = %q{Provides a simple Ruby DSL for defining HTML5 layouts for web apps. For those of us who has written basically the same html head 200 times and feels like minimalism.}
  s.email = %q{post@jostein.be}
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "laydown.gemspec",
     "lib/laydown.rb",
     "lib/templates/default_layout.rb",
     "nothing",
     "templates/default_layout.tenjin.html",
     "test/rough.rb"
  ]
  s.homepage = %q{http://github.com/jbe/laydown}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Pure Ruby HTML5 layout DSL for microframeworks.}
  s.test_files = [
    "test/rough.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<instant_dsl>, [">= 0"])
      s.add_development_dependency(%q<tenjin>, [">= 0"])
    else
      s.add_dependency(%q<instant_dsl>, [">= 0"])
      s.add_dependency(%q<tenjin>, [">= 0"])
    end
  else
    s.add_dependency(%q<instant_dsl>, [">= 0"])
    s.add_dependency(%q<tenjin>, [">= 0"])
  end
end

