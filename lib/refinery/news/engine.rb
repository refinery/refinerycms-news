module Refinery
  module News
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::News
      engine_name :refinery_news

      initializer "init plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_news"
          plugin.menu_match = /refinery\/news(_items)?$/
          plugin.url = Refinery::Core::Engine.routes.url_helpers.refinery_admin_news_items_path
          plugin.activity = {
            :class_name => 'Refinery::News::Item',
            :title => 'title',
            :url_prefix => 'edit'
          }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::News)
      end
    end
  end
end
