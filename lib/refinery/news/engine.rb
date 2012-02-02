module Refinery
  module News
    class Engine < Rails::Engine
      include Refinery::Engine

      isolate_namespace Refinery::News

      initializer "init plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_news"
          plugin.menu_match = /refinery\/news(_items)?$/
          plugin.url = {:controller => '/refinery/news/admin/items'}
          plugin.activity = { :class_name => 'Refinery::News::Item' }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::News)
      end
    end
  end
end
