require 'spec_helper'

module Refinery
  module News
    describe ItemsHelper, :type => :helper do
      describe '#news_item_archive_links' do
        before do
          2.times { FactoryGirl.create(:news_item, :publish_date => Time.utc(2012, 05)) }
          3.times { FactoryGirl.create(:news_item, :publish_date => Time.utc(2012, 04)) }
        end

        it 'returns list of links to archives' do
          expected = '<ul><li><a href="/news/archive/2012/5">May 2012 (2)</a></li><li><a href="/news/archive/2012/4">April 2012 (3)</a></li></ul>'
          expect(helper.news_item_archive_links).to eq(expected)
        end
      end

      describe "#archive_date_format" do
        context "when date_for_month is true" do
          it "returns month and year" do
            expect(helper.archive_date_format(true)).to eq("%B %Y")
          end
        end

        context "when date_for_month is nil" do
          it "returns year" do
            expect(helper.archive_date_format(nil)).to eq("%Y")
          end
        end
      end
    end
  end
end

