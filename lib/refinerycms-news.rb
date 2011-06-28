require 'refinery'
require File.expand_path('../news', __FILE__)

module Refinery
  module News

    class << self
      attr_accessor :root
      def root
	@root ||= Pathname.new(File.expand_path('../../', __FILE__))	
      end
    end

    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
	  plugin.pathname = root
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
