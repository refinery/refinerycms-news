module NavigationHelpers
  module Refinery
    module News
      def path_to(page_name)
        case page_name
        when /the home\s?page/
          root_path
        when /the list of news items/
          admin_news_items_path
        when /the new news item form/
          new_admin_news_item_path
        else
          begin
            if page_name =~ /the news item titled "?([^\"]*)"?/ and (news_item = NewsItem.where(:title => $1).first).present?
              self.url_for(news_item)
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
