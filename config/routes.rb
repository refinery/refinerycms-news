Rails.application.routes.draw do
  scope(:module => 'refinery') do
    scope(:path => 'news', :module => 'news', :as => 'news') do
      resources :items, :only => [:show, :index], :path => ''
      get 'archive/:year(/:month)', :to => 'items#archive', :as => 'archive_news_items'
    end
  end
end

Refinery::Core::Engine.routes.append do
  scope(:module => 'news') do
    scope(:path => 'refinery', :as => 'refinery_admin', :module => 'admin') do
      resources :news, :except => :show, :as => :news_items, :controller => :news_items
    end
  end
end
