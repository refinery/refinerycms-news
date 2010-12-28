require 'spec_helper'

Dir[File.expand_path('../../../features/support/factories.rb', __FILE__)].each {|f| require f}

describe NewsItem do
  describe "validations" do
    before(:each) do
      @attr = {
        :title => "RefinyerCMS",
        :content => "Some random text ...",
        :publish_date => Date.today
      }
    end

    it "rejects empty title" do
      NewsItem.new(@attr.merge(:title => "")).should_not be_valid
    end

    it "rejects empty content" do
      NewsItem.new(@attr.merge(:content => "")).should_not be_valid
    end

    it "rejects empty publish date" do
      NewsItem.new(@attr.merge(:publish_date => "")).should_not be_valid
    end
  end

  describe "attribute aliasing" do
    it "aliases content to body" do
      news_item = Factory(:news_item)
      news_item.content.should == news_item.body
    end
  end

  describe "default scope" do
    it "orders by publish date in DESC order" do
      news_item1 = Factory(:news_item, :publish_date => 1.hour.ago)
      news_item2 = Factory(:news_item, :publish_date => 2.hours.ago)
      news_items = NewsItem.all
      news_items.first.should == news_item1
      news_items.second.should == news_item2
    end
  end

  describe ".published" do
    it "returns only published news items" do
      Factory(:news_item)
      Factory(:news_item, :publish_date => Time.now + 1.hour)
      NewsItem.published.count.should == 1
    end
  end

  describe ".latest" do
    it "returns 10 latest news items by default" do
      5.times { Factory(:news_item) }
      5.times { Factory(:news_item, :publish_date => Time.now + 1.hour) }
      NewsItem.latest.count.should == 5
      7.times { Factory(:news_item) }
      NewsItem.latest.length.should == 10
    end

    it "returns latest n news items" do
      4.times { Factory(:news_item) }
      NewsItem.latest(3).length.should == 3
    end
  end

  describe ".not_published?" do
    it "returns not published news items" do
      news_item = Factory(:news_item, :publish_date => Time.now + 1.hour)
      news_item.not_published?.should be_true
    end
  end
end
