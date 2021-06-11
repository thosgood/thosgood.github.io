# -*- encoding: utf-8 -*-
# stub: nanoc 4.12.1 ruby lib

Gem::Specification.new do |s|
  s.name = "nanoc".freeze
  s.version = "4.12.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Denis Defreyne".freeze]
  s.date = "2021-04-05"
  s.description = "Nanoc is a static-site generator focused on flexibility. It transforms content from a format such as Markdown or AsciiDoc into another format, usually HTML, and lays out pages consistently to retain the site\u2019s look and feel throughout. Static sites built with Nanoc can be deployed to any web server.".freeze
  s.email = "denis+rubygems@denis.ws".freeze
  s.executables = ["nanoc".freeze]
  s.files = ["bin/nanoc".freeze]
  s.homepage = "https://nanoc.ws/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.15".freeze
  s.summary = "A static-site generator with a focus on flexibility.".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.5"])
    s.add_runtime_dependency(%q<colored>.freeze, ["~> 1.2"])
    s.add_runtime_dependency(%q<nanoc-checking>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<nanoc-cli>.freeze, ["= 4.12.1"])
    s.add_runtime_dependency(%q<nanoc-core>.freeze, ["= 4.12.1"])
    s.add_runtime_dependency(%q<nanoc-deploying>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<parallel>.freeze, ["~> 1.12"])
    s.add_runtime_dependency(%q<tty-command>.freeze, ["~> 0.8"])
    s.add_runtime_dependency(%q<tty-which>.freeze, ["~> 0.4"])
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2.5"])
    s.add_dependency(%q<colored>.freeze, ["~> 1.2"])
    s.add_dependency(%q<nanoc-checking>.freeze, ["~> 1.0"])
    s.add_dependency(%q<nanoc-cli>.freeze, ["= 4.12.1"])
    s.add_dependency(%q<nanoc-core>.freeze, ["= 4.12.1"])
    s.add_dependency(%q<nanoc-deploying>.freeze, ["~> 1.0"])
    s.add_dependency(%q<parallel>.freeze, ["~> 1.12"])
    s.add_dependency(%q<tty-command>.freeze, ["~> 0.8"])
    s.add_dependency(%q<tty-which>.freeze, ["~> 0.4"])
  end
end
