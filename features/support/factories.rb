require 'factory_girl'

Factory.define :news_item do |ni|
  ni.title "RefinyerCMS"
  ni.content "Some random text ..."
  ni.publish_date Date.today
end
