Rails.application.routes.draw do
  scope(:module => 'refinery', :as => 'refinery') do
    scope(:path => '', :module => 'news', :as => 'news') do
      scope(:path => 'news') do
        resources :items, :only => [:show, :index], :path => ''
        get 'archive/:year(/:month)', :to => 'items#archive', :as => 'archive_news_items'
      end

      scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
        scope(:path => 'news') do
          resources :items, :except => :show
        end
      end
    end
  end
end
