Gem::Specification.new do |s|

  s.name = %q{refinerycms-news}
  s.version = "0.9.6"

  s.authors = ["Resolve Digital", "Philip Arndt", "David Jones"]
  s.date = %q{2010-03-04}

  s.description = %q{A really straightforward open source Ruby on Rails news plugin designed for integration with RefineryCMS.}
  s.summary = %q{Ruby on Rails news plugin for RefineryCMS.}

  s.email = %q{info@refinerycms.com}

  s.homepage = %q{http://refinerycms.com}
  s.rubygems_version = %q{1.3.4}

  s.files = [
    "app",
    "app/controllers",
    "app/controllers/admin",
    "app/controllers/admin/news_items_controller.rb",
    "app/controllers/news_items_controller.rb",
    "app/models",
    "app/models/news_item.rb",
    "app/views",
    "app/views/admin",
    "app/views/admin/news_items",
    "app/views/admin/news_items/_form.html.erb",
    "app/views/admin/news_items/_news_item.html.erb",
    "app/views/admin/news_items/edit.html.erb",
    "app/views/admin/news_items/index.html.erb",
    "app/views/admin/news_items/new.html.erb",
    "app/views/news_items",
    "app/views/news_items/_recent_posts.html.erb",
    "app/views/news_items/index.html.erb",
    "app/views/news_items/index.rss.builder",
    "app/views/news_items/show.html.erb",
    "config",
    "config/locale",
    "config/locale/en.yml",
    "config/routes.rb",
    "lib",
    "lib/generators",
    "lib/generators/news",
    "lib/generators/news/news_generator.rb",
    "lib/generators/news/templates",
    "lib/generators/news/templates/migration.rb",
    "lib/news.rb",
    "news.md",
    "rails",
    "rails/init.rb"
  ]

end