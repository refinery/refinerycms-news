Gem::Specification.new do |s|
  s.name              = %q{refinerycms-news}
  s.version           = %q{1.1.0}
  s.description       = %q{A really straightforward open source Ruby on Rails news engine designed for integration with RefineryCMS.}
  s.date              = %q{2011-05-10}
  s.summary           = %q{Ruby on Rails news engine for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(Resolve\ Digital)
  s.require_paths     = %w(lib)

  s.add_dependency    'refinerycms-core', '~> 0.9.9.15'

  s.files             = [
    'readme.md',
    'db',
    'db/migrate',
    'db/migrate/5_add_expiration_date_to_news_items.rb',
    'db/migrate/2_add_external_url_to_news_items.rb',
    'db/migrate/1_create_news_items.rb',
    'db/migrate/3_translate_news_items.rb',
    'db/migrate/4_add_image_id_to_news_items.rb',
    'db/seeds',
    'db/seeds/refinerycms_news.rb',
    'config',
    'config/locales',
    'config/locales/pt-BR.yml',
    'config/locales/nl.yml',
    'config/locales/fr.yml',
    'config/locales/cs.yml',
    'config/locales/it.yml',
    'config/locales/de.yml',
    'config/locales/es-MX.yml',
    'config/locales/sl.yml',
    'config/locales/sk.yml',
    'config/locales/lv.yml',
    'config/locales/nb.yml',
    'config/locales/ru.yml',
    'config/locales/en.yml',
    'config/locales/es.yml',
    'config/routes.rb',
    'license.md',
    'lib',
    'lib/refinerycms-news.rb',
    'lib/generators',
    'lib/generators/refinerycms_news_generator.rb',
    'lib/gemspec.rb',
    'lib/news.rb',
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
    'app/views/admin/news_items/_news_item.html.erb',
    'app/views/admin/news_items/index.html.erb',
    'app/views/admin/news_items/_form.html.erb',
    'app/views/admin/news_items/_locale_picker.html.erb',
    'app/views/admin/news_items/new.html.erb',
    'app/views/admin/news_items/edit.html.erb',
    'app/views/news_items',
    'app/views/news_items/_recent_posts.html.erb',
    'app/views/news_items/index.html.erb',
    'app/views/news_items/show.html.erb',
    'app/views/news_items/index.rss.builder',
    'spec',
    'spec/models',
    'spec/models/news_item_spec.rb',
    'features',
    'features/manage_news_items.feature',
    'features/step_definitions',
    'features/step_definitions/news_steps.rb',
    'features/visit_news_items.feature',
    'features/support',
    'features/support/factories.rb',
    'features/support/paths.rb'
  ]
end
