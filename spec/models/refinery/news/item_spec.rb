require 'spec_helper'

module Refinery
  module News
    describe Item, :type => :model do

      let(:news_item) { FactoryBot.create(:news_item) }
      let(:publish_date) { Date.current }

      describe "#archive" do
        let(:publish_date) { Time.utc(2012,1,15) }
        let(:future_date) { Time.utc(2012,2,15) }
        let(:archive_range) { Time.parse("2012-01-17") }

        it "should show 5 news items with publish dates in same month" do
          5.times { FactoryBot.create(:news_item, :publish_date => publish_date) }
          2.times { FactoryBot.create(:news_item, :publish_date => future_date) }

          expect(Refinery::News::Item.by_archive(archive_range).count).to eq(5)
        end
      end

      describe "validations" do
        subject do
          Refinery::News::Item.create!(
            content: 'Some random text ...',
            publish_date: publish_date,
            title: 'Refinery CMS'
          )
        end

        it { is_expected.to be_valid }

        describe '#errors' do
          subject { super().errors }
          it { is_expected.to be_empty }
        end

        describe '#title' do
          subject { super().title }
          it { is_expected.to eq("Refinery CMS") }
        end

        describe '#content' do
          subject { super().content }
          it { is_expected.to eq("Some random text ...") }
        end

        describe '#publish_date' do
          subject { super().publish_date }
          it { is_expected.to eq(publish_date) }
        end
      end

      describe "attribute aliasing" do
        subject { news_item }

        describe '#content' do
          subject { super().content }
          it { is_expected.to eq(news_item.body) }
        end
      end

      describe "default scope" do
        it "orders by publish date in DESC order" do
          news_item1 = FactoryBot.create(:news_item, :publish_date => 1.hour.ago)
          news_item2 = FactoryBot.create(:news_item, :publish_date => 2.hours.ago)
          news_items = Refinery::News::Item.all
          expect(news_items.first).to eq(news_item1)
          expect(news_items.second).to eq(news_item2)
        end
      end

      describe ".not_expired" do
        let!(:news_item) { FactoryBot.create(:news_item) }

        specify "expiration date not set" do
          expect(Refinery::News::Item.not_expired.count).to eq(1)
        end

        specify "expiration date set in future" do
          news_item.expiration_date = Time.now + 1.hour
          news_item.save!
          expect(Refinery::News::Item.not_expired.count).to eq(1)
        end

        specify "expiration date in past" do
          news_item.expiration_date = Time.now - 1.hour
          news_item.save!
          expect(Refinery::News::Item.not_expired.count).to eq(0)
        end
      end

      describe ".published" do
        it "returns only published news items" do
          FactoryBot.create(:news_item)
          FactoryBot.create(:news_item, :publish_date => Time.now + 1.hour)
          expect(Refinery::News::Item.published.count).to eq(1)
        end
      end

      describe ".latest" do
        it "returns 10 latest news items by default" do
          5.times { FactoryBot.create(:news_item) }
          5.times { FactoryBot.create(:news_item, :publish_date => Time.now + 1.hour) }
          expect(Refinery::News::Item.latest.count).to eq(5)
          7.times { FactoryBot.create(:news_item) }
          expect(Refinery::News::Item.latest.count).to eq(10)
        end

        it "returns latest n news items" do
          4.times { FactoryBot.create(:news_item) }
          expect(Refinery::News::Item.latest(3).count).to eq(3)
        end
      end

      describe ".not_published?" do
        it "returns not published news items" do
          news_item = FactoryBot.create(:news_item, :publish_date => Time.now + 1.hour)
          expect(news_item.not_published?).to be_truthy
        end
      end

      describe ".archived" do
        it "returns all published/expired news items" do
          expired = FactoryBot.create(:news_item, :publish_date => Time.now - 2.months, :expiration_date => Time.now - 1.months)
          published = FactoryBot.create(:news_item, :publish_date => Time.now - 1.month)
          not_published = FactoryBot.create(:news_item, :publish_date => Time.now + 1.month)
          expect(Refinery::News::Item.archived).to include(expired)
          expect(Refinery::News::Item.archived).to include(published)
          expect(Refinery::News::Item.archived).to_not include(not_published)
        end
      end

      describe "#should_generate_new_friendly_id?" do
        context "when title changes" do
          it "regenerates slug upon save" do
            news_item = FactoryBot.create(:news_item, :title => "Test Title")

            news_item.title = "Test Title 2"
            news_item.save!

            expect(news_item.slug).to eq("test-title-2")
          end
        end
      end
    end
  end
end
