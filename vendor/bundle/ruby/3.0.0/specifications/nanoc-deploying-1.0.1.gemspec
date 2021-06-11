# -*- encoding: utf-8 -*-
# stub: nanoc-deploying 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nanoc-deploying".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2021-01-01"
  s.description = "Provides deploying functionality for Nanoc".freeze
  s.email = "denis+rubygems@denis.ws".freeze
  s.homepage = "https://nanoc.ws/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Deploying support for Nanoc".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<nanoc-checking>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<nanoc-cli>.freeze, ["~> 4.11", ">= 4.11.15"])
    s.add_runtime_dependency(%q<nanoc-core>.freeze, ["~> 4.11", ">= 4.11.15"])
  else
    s.add_dependency(%q<nanoc-checking>.freeze, ["~> 1.0"])
    s.add_dependency(%q<nanoc-cli>.freeze, ["~> 4.11", ">= 4.11.15"])
    s.add_dependency(%q<nanoc-core>.freeze, ["~> 4.11", ">= 4.11.15"])
  end
end
