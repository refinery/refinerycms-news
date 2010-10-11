Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{0.9.9.4}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with RefineryCMS.}
  s.date              = %q{2010-10-12}
  s.summary           = %q{Ruby on Rails news engine for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\ Digital)
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms', '~> 0.9.8'

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
    'config/locales/es.yml',
    'config/locales/nl.yml',
    'config/locales/pt-BR.yml',
    'config/locales/ru.yml',
    'config/locales/sl.yml',
    'config/routes.rb',
    'lib',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_news',
    'lib/generators/refinerycms_news/templates',
    'lib/generators/refinerycms_news/templates/db',
    'lib/generators/refinerycms_news/templates/db/migrate',
    'lib/generators/refinerycms_news/templates/db/migrate/migration_number_create_singular_name.rb',
    'lib/generators/refinerycms_news/templates/db/seeds',
    'lib/generators/refinerycms_news/templates/db/seeds/seed.rb',
    'lib/generators/refinerycms_news_generator.rb',
    'lib/news.rb',
    'lib/refinerycms-news.rb',
    'license.md',
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
