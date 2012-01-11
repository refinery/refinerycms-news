module Refinery
  module News
    module Admin
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/news_item', :order => "publish_date DESC"

      end
    end
  end
end
