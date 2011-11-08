module Refinery
  class NewsGenerator < Rails::Generators::Base
    def rake_db
      rake("refinery_news:install:migrations")
    end
  end
end
