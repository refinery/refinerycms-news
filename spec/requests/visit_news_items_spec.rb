require "spec_helper"

describe "visit news items" do
  before(:each) do
    Factory.create(:page, :link_url => "/")
    Factory.create(:page, :link_url => "/news", :title => "News")
    @published_news_item = Factory.create(:news_item, :title => "published", :source => "http://refinerycms.com", :publish_date => 1.hour.ago)
    @unpublished_news_item = Factory.create(:news_item, :title => "unpublished", :publish_date => 1.day.from_now)
  end

  it "shows news link in menu" do
    visit "/"

    within "#menu" do
      page.should have_content("News")
      page.should have_selector("a[href='/news']")
    end
  end

  it "shows news item" do
    visit refinery.news_items_path

    page.should have_content("published")
    page.should have_selector("a[href='/news/published']")

    page.should have_no_content("unpublished")
    page.should have_no_selector("a[href='/news/unpublished']")
  end

  it "has a source on the news item" do
    visit refinery.news_item_path(@published_news_item)

    page.should have_content("Source http://refinerycms.com")
  end
end
