# Encoding: UTF-8
require 'date'

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{4.0.0}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with Refinery CMS.}
  s.summary           = %q{Ruby on Rails news engine for Refinery CMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ["Philip Arndt", "Uģis Ozols"]
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency 'refinerycms-core',     '~> 4.0.3'
  s.add_dependency 'refinerycms-settings', '~> 4.0.1'
  s.add_dependency 'friendly_id',          '~> 5.2.1'
  s.add_dependency 'friendly_id-mobility', '~> 0.5'

  # Development dependencies
  s.add_development_dependency 'refinerycms-testing', '~> 4.0.3'
end
