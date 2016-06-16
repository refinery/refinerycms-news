# Encoding: UTF-8

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{3.0.0}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with Refinery CMS.}
  s.summary           = %q{Ruby on Rails news engine for Refinery CMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = ["Philip Arndt", "Uģis Ozols"]
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency    'refinerycms-core',     '~> 3.0.0'
  s.add_dependency    'refinerycms-settings', '~> 3.0.0'
  s.add_dependency    'friendly_id',          ['~> 5.1', '< 5.3']
  s.add_dependency    'globalize',            ['>= 4.0.0', '< 5.2']
  s.add_dependency    'acts_as_indexed',      '~> 0.8.0'
end
