module Refinery
  module News
    class Item < ActiveRecord::Base

      translates :title, :body

      attr_accessor :locale # to hold temporarily

      alias_attribute :content, :body
      validates :title, :content, :publish_date, :presence => true

      has_friendly_id :title, :use_slug => true

      acts_as_indexed :fields => [:title, :body]

      default_scope :order => "publish_date DESC"

      def not_published? # has the published date not yet arrived?
        publish_date > Time.now
      end

      def next
        self.class.next(self).first
      end

      def prev
        self.class.previous(self).first
      end

      class << self
        def by_archive(archive_date)
          where(['publish_date between ? and ?', archive_date.beginning_of_month, archive_date.end_of_month])
        end

        def by_year(archive_year)
          where(['publish_date between ? and ?', archive_year.beginning_of_year, archive_year.end_of_year])
        end

        def all_previous
          where(['publish_date <= ?', Time.now.beginning_of_month])
        end

        def next(item)
          self.send(:with_exclusive_scope) do
            where("publish_date > ?", item.publish_date).order("publish_date ASC")
          end
        end

        def previous(item)
          where("publish_date < ?", item.publish_date).first
        end

        def not_expired
          news_items = Arel::Table.new(self.table_name)
          where(news_items[:expiration_date].eq(nil).or(news_items[:expiration_date].gt(Time.now)))
        end

        def published
          not_expired.where("publish_date < ?", Time.now)
        end

        def latest(limit = 10)
          published.limit(limit)
        end

        def live
          not_expired.where( "publish_date <= ?", Time.now)
        end

        # rejects any page that has not been translated to the current locale.
        def translated
          pages = Arel::Table.new(self.table_name)
          translations = Arel::Table.new(self.translations_table_name)

          includes(:translations).where(
            translations[:locale].eq(Globalize.locale)
          ).where(
            pages[:id].eq(translations[:refinery_news_item_id])
          )
        end

        def teasers_enabled?
          Refinery::Setting.find_or_set(:teasers_enabled, true, :scoping => 'blog')
        end

        def teaser_enabled_toggle!
          currently = Refinery::Setting.find_or_set(:teasers_enabled, true, :scoping => 'blog')
          Refinery::Setting.set(:teasers_enabled, :value => !currently, :scoping => 'blog')
        end
      end

    end
  end
end
