# -*- encoding: utf-8 -*-
# stub: nanoc-core 4.12.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nanoc-core".freeze
  s.version = "4.12.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2021-04-05"
  s.description = "Contains the core of Nanoc".freeze
  s.email = "denis+rubygems@denis.ws".freeze
  s.homepage = "https://nanoc.ws/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "Core of Nanoc".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<concurrent-ruby>.freeze, ["~> 1.1"])
    s.add_runtime_dependency(%q<ddmemoize>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<ddmetrics>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<ddplugin>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<hamster>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<json_schema>.freeze, ["~> 0.19"])
    s.add_runtime_dependency(%q<slow_enumerator_tools>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<tty-platform>.freeze, ["~> 0.2"])
    s.add_runtime_dependency(%q<zeitwerk>.freeze, ["~> 2.1"])
  else
    s.add_dependency(%q<concurrent-ruby>.freeze, ["~> 1.1"])
    s.add_dependency(%q<ddmemoize>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ddmetrics>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ddplugin>.freeze, ["~> 1.0"])
    s.add_dependency(%q<hamster>.freeze, ["~> 3.0"])
    s.add_dependency(%q<json_schema>.freeze, ["~> 0.19"])
    s.add_dependency(%q<slow_enumerator_tools>.freeze, ["~> 1.0"])
    s.add_dependency(%q<tty-platform>.freeze, ["~> 0.2"])
    s.add_dependency(%q<zeitwerk>.freeze, ["~> 2.1"])
  end
end
