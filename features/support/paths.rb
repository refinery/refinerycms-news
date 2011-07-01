module NavigationHelpers
  module Refinery
    module NewsItem
      def path_to(page_name)
        case page_name
        when /the list of news items/
          refinery_admin_news_items_path
        when /the new news item form/
          new_refinery_admin_news_item_path
        else
          begin
            if page_name =~ /the news item titled "?([^\"]*)"?/ and (news_item = Refinery::NewsItem.where(:title => $1).first).present?
              news_item_path(news_item)
            else
              nil
            end
          rescue
            nil
          end
        end
      end
    end
  end
end
