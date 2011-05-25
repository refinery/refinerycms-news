#!/usr/bin/env ruby
require File.expand_path('../news.rb', __FILE__)
version = ::Refinery::News.version
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem(spec)?$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{#{version}}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with RefineryCMS.}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Ruby on Rails news engine for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\\ Digital)
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms-core', '~> 1.0.0'

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
end
EOF

File.open(File.expand_path("../../refinerycms-news.gemspec", __FILE__), 'w').puts(gemspec)