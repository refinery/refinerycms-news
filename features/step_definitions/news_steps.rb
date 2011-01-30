Given /^I (only )?have a news item titled "?([^\"]*)"?$/ do |only, title|
  NewsItem.delete_all if only

  Factory(:news_item, :title => title)
end

Given /^I (only )?have news items titled "?([^\"]*)"?$/ do |only, titles|
  NewsItem.delete_all if only

  titles.split(', ').each do |title|
    Factory(:news_item, :title => title)
  end
end

Given /^I have no news items$/ do
  NewsItem.delete_all
end

Given /^the news item titled "?([^\"]*)"? is not published$/ do |title|
  NewsItem.where(:title => title).first.update_attribute(:publish_date, Time.now + 1.day)
end

Then /^I should have ([0-9]+) news items?$/ do |count|
  NewsItem.count.should == count.to_i
end
