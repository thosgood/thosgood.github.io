# -*- encoding: utf-8 -*-
# stub: nanoc-live 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "nanoc-live".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2021-02-20"
  s.description = "Provides support for auto-recompiling Nanoc sites.".freeze
  s.email = "denis+rubygems@denis.ws".freeze
  s.homepage = "https://nanoc.ws/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Live recompilation support for Nanoc".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<adsf-live>.freeze, ["~> 1.4"])
    s.add_runtime_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<nanoc-cli>.freeze, ["~> 4.11", ">= 4.11.14"])
    s.add_runtime_dependency(%q<nanoc-core>.freeze, ["~> 4.11", ">= 4.11.14"])
  else
    s.add_dependency(%q<adsf-live>.freeze, ["~> 1.4"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_dependency(%q<nanoc-cli>.freeze, ["~> 4.11", ">= 4.11.14"])
    s.add_dependency(%q<nanoc-core>.freeze, ["~> 4.11", ">= 4.11.14"])
  end
end
