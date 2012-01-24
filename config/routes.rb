Rails.application.routes.draw do
  scope(:module => 'refinery', :as => 'refinery') do
    scope(:path => '', :module => 'news', :as => 'news') do
      scope(:path => 'news') do
        get 'archive/:year(/:month)', :to => 'items#archive', :as => 'items_archive'
        resources :items, :only => [:show, :index], :path => ''
      end

      scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
        scope(:path => 'news') do
          resources :items, :except => :show
        end
      end
    end
  end
end
