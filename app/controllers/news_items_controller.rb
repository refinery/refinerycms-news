class NewsItemsController < ApplicationController

  before_filter :find_latest_news_items, :find_page
  before_filter :find_news_item, :only => [:show]

protected

  def find_latest_news_items
    @news_items = NewsItem.latest.paginate(:page => params[:page]) # 10 items
  end

  def find_news_item
    @news_item = NewsItem.published.find(params[:id])
  end

  def find_page
    @page = Page.find_by_link_url("/news")
  end

end
