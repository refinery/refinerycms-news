require "spec_helper"

describe "visit news items", :type => :feature do
  before do
    FactoryBot.create(:page, :link_url => "/")
    FactoryBot.create(:page, :link_url => "/news", :title => "News")
    FactoryBot.create(:news_item, :title => "unpublished", :publish_date => 1.day.from_now)
    @published_news_item = FactoryBot.create(:news_item, :title => "published", :source => "http://refinerycms.com", :publish_date => 1.hour.ago)
  end

  it "shows news link in menu" do
    visit "/"

    within "#menu" do
      expect(page).to have_content("News")
      expect(page).to have_selector("a[href='/news']")
    end
  end

  it "shows news item" do
    visit refinery.news_items_path

    expect(page).to have_content("published")
    expect(page).to have_selector("a[href='/news/published']")

    expect(page).to have_no_content("unpublished")
    expect(page).to have_no_selector("a[href='/news/unpublished']")
  end

  it "has a source on the news item" do
    visit refinery.news_item_path(@published_news_item)

    expect(page).to have_content("Source http://refinerycms.com")
  end
end
