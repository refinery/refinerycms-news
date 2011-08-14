FactoryGirl.define do
  factory :news_item, :class => Refinery::NewsItem do
    title "RefineryCMS News Item"
    content "Some random text ..."
    publish_date Time.now - 5.minutes
  end
end
