# -*- encoding: utf-8 -*-
# stub: em-postgresql-adapter 0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "em-postgresql-adapter"
  s.version = "0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ruben Nine", "Christopher J. Bottaro", "Bruce Chu", "Anton Orel", "Laust Rud Jacobsen"]
  s.date = "2011-11-27"
  s.email = "ruben@leftbee.net"
  s.files = ["LICENSE", "README.md", "Rakefile", "em-postgresql-adapter.gemspec", "lib/active_record/connection_adapters/em_postgresql_adapter.rb", "lib/em-postgresql-adapter/fibered_postgresql_connection.rb"]
  s.homepage = "http://github.com/leftbee/em-postgresql-adapter"
  s.rubygems_version = "2.4.8"
  s.summary = "PostgreSQL fiber-based ActiveRecord 3.1 connection adapter for Ruby 1.9"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pg>, [">= 0.8.0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 3.1.0"])
      s.add_runtime_dependency(%q<eventmachine>, [">= 0"])
    else
      s.add_dependency(%q<pg>, [">= 0.8.0"])
      s.add_dependency(%q<activerecord>, [">= 3.1.0"])
      s.add_dependency(%q<eventmachine>, [">= 0"])
    end
  else
    s.add_dependency(%q<pg>, [">= 0.8.0"])
    s.add_dependency(%q<activerecord>, [">= 3.1.0"])
    s.add_dependency(%q<eventmachine>, [">= 0"])
  end
end
