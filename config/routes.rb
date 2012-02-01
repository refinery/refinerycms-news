Rails.application.routes.draw do
  namespace :news do
    root :to => "items#index"
    get 'archive/:year(/:month)', :to => 'items#archive', :as => 'items_archive'
    resources :items, :only => [:show, :index], :path => ''
  end

  scope(:as => 'refinery', :module => 'refinery') do
    scope(:module => 'news', :as => 'news') do

      scope(:module => 'admin', :path => 'refinery/news', :as => 'admin') do
        resources :items, :path => '', :except => :show
      end
    end
  end
end
