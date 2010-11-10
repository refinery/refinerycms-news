require 'factory_girl'

Factory.define :news_item do |ni|
  ni.title "RefineryCMS News Item"
  ni.content "Some random text ..."
  ni.publish_date Time.now - 5.minutes
end
