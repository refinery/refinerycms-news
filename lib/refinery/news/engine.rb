module Refinery
  module News
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_news

      initializer "register refinerycms_news plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_news"
          plugin.url = app.routes.url_helpers.refinery_admin_news_items_path
          plugin.menu_match = /refinery\/news(_items)?$/
          plugin.activity = {
            :class_name => :'refinery/news_item'
          }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::News)
      end
    end
  end
end
