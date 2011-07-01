require 'factory_girl'

Factory.define :news_item, :class => Refinery::NewsItem do |ni|
  ni.title "RefineryCMS News Item"
  ni.content "Some random text ..."
  ni.publish_date Time.now - 5.minutes
end
