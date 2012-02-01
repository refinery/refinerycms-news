Rails.application.routes.draw do
  scope(:as => 'refinery', :module => 'refinery') do
    scope(:module => 'news', :as => 'news') do
      scope path: '/news' do
        root :to => "items#index"
        get 'archive/:year(/:month)', :to => 'items#archive', :as => 'items_archive'
        resources :items, :only => [:show, :index], :path => ''
      end

      scope(:module => 'admin', :path => 'refinery/news', :as => 'admin') do
        resources :items, :path => '', :except => :show
      end
    end
  end
end
