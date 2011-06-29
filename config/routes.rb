Refinery::Application.routes.draw do
  scope(:module => 'refinery') do
    resources :news, :as => :news_items, :controller => :news_items, :only => [:show, :index]

    scope(:path => 'refinery', :as => 'refinery_admin', :module => 'admin') do
      resources :news, :except => :show, :as => :news_items, :controller => :news_items
    end
  end
end
