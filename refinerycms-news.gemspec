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
    'db',
    'db/seeds',
    'db/seeds/refinerycms_news.rb',
    'db/migrate',
    'db/migrate/2_add_external_url_to_news_items.rb',
    'db/migrate/1_create_news_items.rb',
    'db/migrate/5_add_expiration_date_to_news_items.rb',
    'db/migrate/6_remove_image_id_and_external_url_from_news.rb',
    'db/migrate/4_add_image_id_to_news_items.rb',
    'db/migrate/3_translate_news_items.rb',
    'config',
    'config/locales',
    'config/locales/de.yml',
    'config/locales/sl.yml',
    'config/locales/es-MX.yml',
    'config/locales/es.yml',
    'config/locales/bg.yml',
    'config/locales/fr.yml',
    'config/locales/en.yml',
    'config/locales/nb.yml',
    'config/locales/it.yml',
    'config/locales/sk.yml',
    'config/locales/cs.yml',
    'config/locales/ru.yml',
    'config/locales/lv.yml',
    'config/locales/pt-BR.yml',
    'config/locales/nl.yml',
    'config/routes.rb',
    'spec',
    'spec/models',
    'spec/models/news_item_spec.rb',
    'license.md',
    'app',
    'app/controllers',
    'app/controllers/refinery',
    'app/controllers/refinery/admin',
    'app/controllers/refinery/admin/news_items_controller.rb',
    'app/controllers/refinery/news_items_controller.rb',
    'app/models',
    'app/models/refinery',
    'app/models/refinery/news_item.rb',
    'app/views',
    'app/views/refinery',
    'app/views/refinery/admin',
    'app/views/refinery/admin/news_items',
    'app/views/refinery/admin/news_items/index.html.erb',
    'app/views/refinery/admin/news_items/_news_item.html.erb',
    'app/views/refinery/admin/news_items/edit.html.erb',
    'app/views/refinery/admin/news_items/_locale_picker.html.erb',
    'app/views/refinery/admin/news_items/_form.html.erb',
    'app/views/refinery/admin/news_items/new.html.erb',
    'app/views/refinery/news_items',
    'app/views/refinery/news_items/index.rss.builder',
    'app/views/refinery/news_items/index.html.erb',
    'app/views/refinery/news_items/_recent_posts.html.erb',
    'app/views/refinery/news_items/show.html.erb',
    'readme.md',
    'features',
    'features/step_definitions',
    'features/step_definitions/news_steps.rb',
    'features/visit_news_items.feature',
    'features/support',
    'features/support/paths.rb',
    'features/support/factories.rb',
    'features/manage_news_items.feature',
    'lib',
    'lib/generators',
    'lib/generators/refinerycms_news_generator.rb',
    'lib/gemspec.rb',
    'lib/news.rb',
    'lib/refinerycms-news.rb'
  ]
end
