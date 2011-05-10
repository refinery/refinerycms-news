require 'spec_helper'

Dir[File.expand_path('../../../features/support/factories.rb', __FILE__)].each {|f| require f}

describe NewsItem do
  
  let(:time_now) { Time.now }
  let(:news_item) { Factory(:news_item) }

  describe "validations" do
    subject do
      news_item = NewsItem.create! :title => "RefinyerCMS",
                                   :content => "Some random text ...",
                                   :publish_date => time_now
      news_item
    end

    it { should be_valid }
    its(:errors) { should be_empty }
    its(:title) { should == "RefinyerCMS" }
    its(:content) { should == "Some random text ..." }
    its(:publish_date) { should == time_now }
  end

  describe "attribute aliasing" do
    subject { news_item }
    its(:content) { should == news_item.body }
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

  describe ".not_expired" do
    let!(:news_item) { Factory(:news_item) }

    specify "expiration date not set" do
      NewsItem.not_expired.count.should == 1
    end

    specify "expiration date set in future" do
      news_item.expiration_date = Time.now + 1.hour
      news_item.save!
      NewsItem.not_expired.count.should == 1
    end

    specify "expiration date in past" do
      news_item.expiration_date = Time.now - 1.hour
      news_item.save!
      NewsItem.not_expired.count.should == 0
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
