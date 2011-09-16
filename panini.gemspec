# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "panini"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mjbellantoni"]
  s.date = "2011-09-16"
  s.description = "Panini allows you to generate sentences from a context-free grammar, also known as a CFG."
  s.email = "mjbellantoni@yahoo.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "examples/arithmetic_expression.rb",
    "lib/derivation_strategy/base.rb",
    "lib/derivation_strategy/exhaustive.rb",
    "lib/derivation_strategy/leftmost.rb",
    "lib/derivation_strategy/random_dampened.rb",
    "lib/grammar.rb",
    "lib/hash.rb",
    "lib/nonterminal.rb",
    "lib/panini.rb",
    "panini.gemspec",
    "spec/derivation_strategy/dampened_probability_production_choice_proxy_spec.rb",
    "spec/derivation_strategy/exhaustive_spec.rb",
    "spec/derivation_strategy/leftmost_spec.rb",
    "spec/derivation_strategy/random_dampened_spec.rb",
    "spec/grammar_spec.rb",
    "spec/nonterminal_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/basic_derivation_strategy_shared_example.rb"
  ]
  s.homepage = "http://github.com/mjbellantoni/panini"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Create sentences from a context-free grammar (CFG)"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

