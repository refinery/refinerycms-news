Refinery::News::Engine.routes.draw do
  resources :news, :as => :items, :controller => :items, :only => [:show, :index], :path => ''
end

Refinery::Core::Engine.routes.append do
  scope(:path => 'refinery', :as => 'refinery_admin', :module => 'admin') do
    resources :news, :except => :show, :as => :news_items, :controller => :news_items
  end
end