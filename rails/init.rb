Refinery::Plugin.register do |plugin|
  plugin.title = "News"
  plugin.name = "news"
  plugin.description = "Provides a blog-like news section"
  plugin.version = 1.0
  plugin.menu_match = /(admin|refinery)\/news(_items)?$/
  plugin.url = '/refinery/news'
  plugin.activity = {
    :class => NewsItem,
    :title => 'title',
    :url_prefix => 'edit'
  }
  plugin.directory = directory
end