# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{laydown}
  s.version = "0.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jbe"]
  s.date = %q{2011-02-27}
  s.description = %q{Provides a simple Ruby DSL for defining HTML5 layouts for web apps. For those who has written the same layout too many times.}
  s.email = %q{post@jostein.be}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "laydown.gemspec",
    "lib/laydown.rb",
    "lib/laydown/template.rb",
    "spec/laydown_spec.rb",
    "template.slim"
  ]
  s.homepage = %q{http://github.com/jbe/laydown}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Make HTML5 layouts quickly with plain Ruby.}
  s.test_files = [
    "spec/laydown_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<temple>, [">= 0"])
      s.add_runtime_dependency(%q<tilt>, [">= 0"])
      s.add_development_dependency(%q<slim>, [">= 0"])
    else
      s.add_dependency(%q<temple>, [">= 0"])
      s.add_dependency(%q<tilt>, [">= 0"])
      s.add_dependency(%q<slim>, [">= 0"])
    end
  else
    s.add_dependency(%q<temple>, [">= 0"])
    s.add_dependency(%q<tilt>, [">= 0"])
    s.add_dependency(%q<slim>, [">= 0"])
  end
end

