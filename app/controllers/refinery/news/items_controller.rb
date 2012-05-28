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

      def archive
        if params[:month].present?
          date = "#{params[:month]}/#{params[:year]}"
          @archive_date = Time.parse(date)
          @items = Refinery::News::Item.live.by_archive(@archive_date).page(params[:page])
        else
          date = "01/#{params[:year]}"
          @archive_date = Time.parse(date)
          @items = Refinery::News::Item.live.by_year(@archive_date).page(params[:page])
        end
      end

      protected

      def find_latest_news_items
        @items = Refinery::News::Item.latest.translated
      end

      def find_published_news_items
        @items = Refinery::News::Item.published.translated.page(params[:page])
      end

      def find_news_item
        @item = Refinery::News::Item.published.translated.find(params[:id])
      end

      def find_page
        @page = ::Refinery::Page.find_by_link_url("/news") if defined?(::Refinery::Page)
      end

    end
  end
end
