Refinery::Core::Engine.routes.draw do
  namespace :news, :path => '' do
    root :to => "items#index"
    get 'archive/:year(/:month)', :to => 'items#archive', :as => 'items_archive'
    resources :items, :only => [:show, :index], :path => ''

    namespace :admin, :path => 'refinery' do
      scope :path => 'news' do
        root :to => "items#index"
        resources :items, :except => :show
      end
    end
  end
end
