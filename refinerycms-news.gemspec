Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{0.9.8.3}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with RefineryCMS.}
  s.date              = %q{2010-08-26}
  s.summary           = %q{Ruby on Rails news engine for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\ Digital)
  s.require_paths     = %w(lib)

  s.files             = [
    'app',
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
    'config',
    'config/locales',
    'config/locales/en.yml',
    'config/locales/nl.yml',
    'config/locales/pt-BR.yml',
    'config/routes.rb',
    'generators',
    'generators/news',
    'generators/news/news_generator.rb',
    'generators/news/templates',
    'generators/news/templates/migration.rb',
    'lib',
    'lib/gemspec.rb',
    'lib/news.rb',
    'license.md',
    'rails',
    'rails/init.rb',
    'readme.md',
    'test',
    'test/fixtures',
    'test/fixtures/news_items.yml',
    'test/unit',
    'test/unit/news_items_test.rb'
  ]
  s.test_files        = [
    'test/unit/news_items_test.rb'
  ]
end
