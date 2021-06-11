# -*- encoding: utf-8 -*-
# stub: adsf-live 1.4.6 ruby lib

Gem::Specification.new do |s|
  s.name = "adsf-live".freeze
  s.version = "1.4.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2021-05-16"
  s.description = "Automatically reloads when changes are detected.".freeze
  s.email = "denis.defreyne@stoneship.org".freeze
  s.homepage = "http://github.com/ddfreyne/adsf/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "livereload support for adsf".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<adsf>.freeze, ["~> 1.3"])
    s.add_runtime_dependency(%q<em-websocket>.freeze, ["~> 0.5"])
    s.add_runtime_dependency(%q<eventmachine>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_runtime_dependency(%q<rack-livereload>.freeze, ["~> 0.3"])
  else
    s.add_dependency(%q<adsf>.freeze, ["~> 1.3"])
    s.add_dependency(%q<em-websocket>.freeze, ["~> 0.5"])
    s.add_dependency(%q<eventmachine>.freeze, ["~> 1.2"])
    s.add_dependency(%q<listen>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rack-livereload>.freeze, ["~> 0.3"])
  end
end
