module Refinery
  module News
    class ItemsController < ::ApplicationController
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
        @news_items = Refinery::News::Item.latest.translated
      end

      def find_published_news_items
        @news_items = Refinery::News::Item.published.translated.page(params[:page])
      end

      def find_news_item
        @news_item = Refinery::News::Item.published.translated.find(params[:id])
      end

      def find_page
        @page = ::Refinery::Page.find_by_link_url("/news") if defined?(::Refinery::Page)
      end

    end
  end
end