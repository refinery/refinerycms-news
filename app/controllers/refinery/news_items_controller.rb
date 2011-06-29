module Refinery
  class NewsItemsController < ApplicationController
    before_filter :find_page
    before_filter :find_published_news_items, :only => [:index]
    before_filter :find_news_item, :find_latest_news_items, :only => [:show]

    def index
      # render 'index'
    end

    def show
      # render 'show'
    end

    protected

    def find_latest_news_items
      @news_items = NewsItem.latest.translated
    end

    def find_published_news_items
      @news_items = NewsItem.published.translated.paginate(:page => params[:page],
                                                :per_page => NewsItem.per_page)
    end

    def find_news_item
      @news_item = NewsItem.published.translated.find(params[:id])
    end

    def find_page
      @page = Page.find_by_link_url("/news")
    end

  end
end
