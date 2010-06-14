ActionController::Routing::Routes.draw do |map|
  map.resources :news_items, :as => :news

  map.namespace(:admin, :path_prefix => (defined?(REFINERY_GEM_VERSION) ? 'admin' : 'refinery')) do |admin|
    admin.resources :news_items, :as => :news
  end
end
