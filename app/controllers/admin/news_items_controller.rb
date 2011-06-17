class Admin::NewsItemsController < Admin::BaseController
  before_filter :show_preview, :only => [:new, :edit, :create]
  before_filter :has_image, :only => [:new, :edit, :create]

  crudify :news_item, :order => "publish_date DESC"

  protected
  def show_preview
    @show_preview ||= RefinerySetting.get_or_set(:refinery_news_show_preview, true)
  end
  def has_image
    @has_image ||= RefinerySetting.get_or_set(:refinery_news_has_image, true)
  end
end
