# -*- encoding: utf-8 -*-
# stub: nanoc-cli 4.12.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nanoc-cli".freeze
  s.version = "4.12.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2021-04-05"
  s.description = "Provides the CLI for Nanoc".freeze
  s.email = "denis+rubygems@denis.ws".freeze
  s.homepage = "https://nanoc.ws/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "CLI for Nanoc".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<cri>.freeze, ["~> 2.15"])
    s.add_runtime_dependency(%q<diff-lcs>.freeze, ["~> 1.3"])
    s.add_runtime_dependency(%q<nanoc-core>.freeze, ["= 4.12.1"])
    s.add_runtime_dependency(%q<zeitwerk>.freeze, ["~> 2.1"])
  else
    s.add_dependency(%q<cri>.freeze, ["~> 2.15"])
    s.add_dependency(%q<diff-lcs>.freeze, ["~> 1.3"])
    s.add_dependency(%q<nanoc-core>.freeze, ["= 4.12.1"])
    s.add_dependency(%q<zeitwerk>.freeze, ["~> 2.1"])
  end
end
