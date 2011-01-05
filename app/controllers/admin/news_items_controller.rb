class Admin::NewsItemsController < Admin::BaseController

  crudify :news_item, :order => "publish_date DESC"

end
