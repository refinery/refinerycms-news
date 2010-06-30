#!/usr/bin/env ruby
require File.expand_path('../news.rb', __FILE__)
version = Refinery::News::Version::STRING
raise "Could not get version so gemspec can not be built" if version.nil?
files = %w( readme.md license.md  )
%w(app bin config db lib public rails test vendor).each do |dir|
  files += Dir.glob("#{dir}/**/*") if File.directory?(dir)
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
  s.authors           = %w(Resolve\\ Digital Philip\\ Arndt David\\ Jones)
  s.require_paths     = %w(lib)
  s.executables       = %w()

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  #{"s.test_files        = [
    '#{Dir.glob("test/**/*.rb").join("',\n    '")}'
  ]" if File.directory?("test")}
end
EOF

if (save = ARGV.delete('-s'))
  if File.exist?(file = File.expand_path("../../refinerycms-news.gemspec", __FILE__))
    File.delete(file)
  end
  File.open(file, 'w') { |f| f.puts gemspec }
else
  puts gemspec
end
