module Refinery
  module Admin
    class NewsItemsController < ::Admin::BaseController

      crudify :'refinery/news_item', :order => "publish_date DESC"

    end
  end
end
