module Refinery
  module News
    module ItemsHelper
      def item_archive_widget
        items = Refinery::News::Item.select('published_at').all_previous
        return nil if items.blank?

        render :partial => "/refinery/news/items/widgets/news_archive", :locals => { :items => items }
      end
      alias_method :news_archive_list, :news_archive_widget

      def next_or_previous?(item)
        item.next.present? or item.prev.present?
      end

      def news_item_teaser_enabled?
        Refinery::News::Item.teasers_enabled?
      end

      def news_item_teaser(item)
        if item.respond_to?(:custom_teaser) && item.custom_teaser.present?
         item.custom_teaser.html_safe
        else
         truncate(item.body, {
           :length => Refinery::Setting.find_or_set(:news_item_teaser_length, 250),
           :preserve_html_tags => true
          }).html_safe
        end
      end

      def archive_link(item)
        if item.published_at >= Time.now.end_of_year.advance(:years => -3)
          post_date = item.published_at.strftime('%m/%Y')
          year = post_date.split('/')[1]
          month = post_date.split('/')[0]
          count = News::Item.by_archive(Time.parse(post_date)).size
          text = t("date.month_names")[month.to_i] + " #{year} (#{count})"

          link_to(text, main_app.archive_news_items_path(:year => year, :month => month))
        else
          post_date = post.published_at.strftime('01/%Y')
          year = post_date.split('/')[1]
          count = Refinery::News::Item.by_year(Time.parse(post_date)).size
          text = "#{year} (#{count})"

          link_to(text, main_app.archive_news_items_path(:year => year))
        end
      end
    end
  end
end
