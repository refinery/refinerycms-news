module Refinery
  module News
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::News

      initializer "init plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_news"
          plugin.menu_match = /refinery\/news(\/items)?$/
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.news_admin_items_path }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::News)
      end
    end
  end
end
