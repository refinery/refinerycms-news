module Refinery
  module Admin
    class NewsItemsController < ::Refinery::AdminController

      crudify :'refinery/news_item', :order => "publish_date DESC"

    end
  end
end
