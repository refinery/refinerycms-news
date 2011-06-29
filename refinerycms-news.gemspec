Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{1.2.0}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with RefineryCMS.}
  s.date              = %q{2011-06-29}
  s.summary           = %q{Ruby on Rails news engine for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\ Digital)
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms-core', '~> 1.1.0'

  s.files             = [
    'generators',
    'generators/refinerycms_news_generator.rb',
    'gemspec.rb',
    'news.rb',
    'refinerycms-news.rb'
  ]
end
