FactoryGirl.define do
  factory :news_item, :class => Refinery::News::Item do
    title "Refinery CMS News Item"
    content "Some random text ..."
    publish_date Time.now - 5.minutes
  end
end
