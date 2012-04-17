module Refinery
  module News
    module ItemsHelper
      def news_item_archive_widget
        items = Refinery::News::Item.select('publish_date').all_previous
        return nil if items.blank?

        render :partial => "/refinery/news/items/widgets/news_archive", :locals => { :items => items }
      end
      alias_method :news_archive_list, :news_item_archive_widget

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

      def news_item_archive_links
        html = ''
        @item_months = ::Refinery::News::Item.published.group_by {|i| i.publish_date.beginning_of_month}
        @item_months.each do |month, items|
          if items.present?
            text = "#{t("date.month_names")[month.month]} #{month.year} (#{items.count})"
            html += "<li>#{link_to(text, refinery.news_items_archive_path(:year => month.year, :month => month.month))}</li>"
          end
        end
        content_tag('ul', raw(html))
      end
    end
  end
end
