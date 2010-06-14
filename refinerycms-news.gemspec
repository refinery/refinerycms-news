Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{0.9.7.3}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with RefineryCMS.}
  s.date              = %q{2010-06-15}
  s.summary           = %q{Ruby on Rails news engine for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\ Digital Philip\ Arndt David\ Jones)
  s.require_paths     = %w(lib)
  s.executables       = %w()

  s.files             = [
    'readme.md',
    'license.md',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/news_items_controller.rb',
    'app/controllers/news_items_controller.rb',
    'app/models',
    'app/models/news_item.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/news_items',
    'app/views/admin/news_items/_form.html.erb',
    'app/views/admin/news_items/_news_item.html.erb',
    'app/views/admin/news_items/edit.html.erb',
    'app/views/admin/news_items/index.html.erb',
    'app/views/admin/news_items/new.html.erb',
    'app/views/news_items',
    'app/views/news_items/_recent_posts.html.erb',
    'app/views/news_items/index.html.erb',
    'app/views/news_items/index.rss.builder',
    'app/views/news_items/show.html.erb',
    'config/locale',
    'config/locale/en.yml',
    'config/routes.rb',
    'lib/gemspec.rb',
    'lib/news.rb',
    'rails/init.rb'
  ]
  
end
