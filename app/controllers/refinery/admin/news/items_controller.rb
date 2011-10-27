module Refinery
  module Admin
    module News
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/news_item', :order => "publish_date DESC"

      end
    end
  end
end
