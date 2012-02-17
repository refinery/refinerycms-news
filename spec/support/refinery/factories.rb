FactoryGirl.define do
  unless FactoryGirl.factories.registered?(:news_item)
    factory :news_item, :class => Refinery::News::Item do
      title "RefineryCMS News Item"
      content "Some random text ..."
      publish_date Time.now - 5.minutes
    end
  end
end
