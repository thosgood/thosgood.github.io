# -*- encoding: utf-8 -*-
# stub: ddmemoize 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ddmemoize".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2018-01-07"
  s.email = ["denis+rubygems@denis.ws".freeze]
  s.homepage = "https://github.com/ddfreyne/ddmemoize".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Adds support for memoizing functions".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<ddmetrics>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<ref>.freeze, ["~> 2.0"])
  else
    s.add_dependency(%q<ddmetrics>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ref>.freeze, ["~> 2.0"])
  end
end
