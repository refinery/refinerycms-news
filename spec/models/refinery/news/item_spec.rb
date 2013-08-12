require 'spec_helper'

module Refinery
  module News
    describe Item do

      let(:time_now) { Time.now }
      let(:news_item) { FactoryGirl.create(:news_item) }

      describe "#archive" do
        let(:publish_date) { Time.utc(2012,1,15) }
        let(:future_date) { Time.utc(2012,2,15) }
        let(:archive_range) { Time.parse("2012-01-17") }

        it "should show 5 news items with publish dates in same month" do
          5.times { FactoryGirl.create(:news_item, :publish_date => publish_date) }
          2.times { FactoryGirl.create(:news_item, :publish_date => future_date) }

          Refinery::News::Item.by_archive(archive_range).count.should == 5
        end
      end

      describe "validations" do
        subject do
          news_item = Refinery::News::Item.create! :title => "Refinery CMS",
                                                 :content => "Some random text ...",
                                                 :publish_date => time_now
          news_item
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
        its(:content) { should == "Some random text ..." }
        its(:publish_date) { should == time_now }
      end

      describe "attribute aliasing" do
        subject { news_item }
        its(:content) { should == news_item.body }
      end

      describe "default scope" do
        it "orders by publish date in DESC order" do
          news_item1 = FactoryGirl.create(:news_item, :publish_date => 1.hour.ago)
          news_item2 = FactoryGirl.create(:news_item, :publish_date => 2.hours.ago)
          news_items = Refinery::News::Item.all
          news_items.first.should == news_item1
          news_items.second.should == news_item2
        end
      end

      describe ".not_expired" do
        let!(:news_item) { FactoryGirl.create(:news_item) }

        specify "expiration date not set" do
          Refinery::News::Item.not_expired.count.should == 1
        end

        specify "expiration date set in future" do
          news_item.expiration_date = Time.now + 1.hour
          news_item.save!
          Refinery::News::Item.not_expired.count.should == 1
        end

        specify "expiration date in past" do
          news_item.expiration_date = Time.now - 1.hour
          news_item.save!
          Refinery::News::Item.not_expired.count.should == 0
        end
      end

      describe ".published" do
        it "returns only published news items" do
          FactoryGirl.create(:news_item)
          FactoryGirl.create(:news_item, :publish_date => Time.now + 1.hour)
          Refinery::News::Item.published.count.should == 1
        end
      end

      describe ".latest" do
        it "returns 10 latest news items by default" do
          5.times { FactoryGirl.create(:news_item) }
          5.times { FactoryGirl.create(:news_item, :publish_date => Time.now + 1.hour) }
          Refinery::News::Item.latest.count.should == 5
          7.times { FactoryGirl.create(:news_item) }
          Refinery::News::Item.latest.count.should == 10
        end

        it "returns latest n news items" do
          4.times { FactoryGirl.create(:news_item) }
          Refinery::News::Item.latest(3).count.should == 3
        end
      end

      describe ".not_published?" do
        it "returns not published news items" do
          news_item = FactoryGirl.create(:news_item, :publish_date => Time.now + 1.hour)
          news_item.not_published?.should be_true
        end
      end

      describe ".archived" do
        it "returns all published/expired news items" do
          expired = FactoryGirl.create(:news_item, :publish_date => Time.now - 2.months, :expiration_date => Time.now - 1.months)
          published = FactoryGirl.create(:news_item, :publish_date => Time.now - 1.month)
          not_published = FactoryGirl.create(:news_item, :publish_date => Time.now + 1.month)
          expect(Refinery::News::Item.archived).to include(expired)
          expect(Refinery::News::Item.archived).to include(published)
          expect(Refinery::News::Item.archived).to_not include(not_published)
        end
      end
    end
  end
end
