require File.expand_path('../generators/news_generator', __FILE__)
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
      isolate_namespace Refinery::News

      initializer "init plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_news"
          plugin.menu_match = /refinery\/news(_items)?$/
          plugin.url = Refinery::Core::Engine.routes.url_helpers.refinery_admin_news_items_path
          plugin.activity = {
            :class_name => 'NewsItem',
            :title => 'title',
            :url_prefix => 'edit'
          }
        end
      end
    end

  end
end
