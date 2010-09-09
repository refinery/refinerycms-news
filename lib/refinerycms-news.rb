require 'refinery'
require File.expand_path('../news', __FILE__)

module Refinery
  module News

    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinerycms_news"
          plugin.menu_match = /(admin|refinery)\/news(_items)?$/
          plugin.url = {:controller => '/admin/news_items', :action => 'index'}
          plugin.activity = {
            :class => NewsItem,
            :title => 'title',
            :url_prefix => 'edit'
          }
        end
      end
    end

  end
end