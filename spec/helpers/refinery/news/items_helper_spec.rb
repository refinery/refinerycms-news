require 'spec_helper'

module Refinery
  module News
    describe ItemsHelper do
      describe '#news_item_archive_links' do
        before do
          2.times { FactoryGirl.create(:news_item, :publish_date => Time.utc(2012, 05)) }
          3.times { FactoryGirl.create(:news_item, :publish_date => Time.utc(2012, 04)) }
        end

        it 'returns list of links to archives' do
          expected = '<ul><li><a href="/news/archive/2012/5">May 2012 (2)</a></li><li><a href="/news/archive/2012/4">April 2012 (3)</a></li></ul>'
          helper.news_item_archive_links.should eq(expected)
        end
      end
    end
  end
end

