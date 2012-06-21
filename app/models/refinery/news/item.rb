module Refinery
  module News
    class Item < Refinery::Core::BaseModel
      extend FriendlyId

      translates :title, :body

      attr_accessor :locale # to hold temporarily
      attr_accessible :title, :body, :content, :source, :publish_date, :expiration_date
      class Translation
        attr_accessible :locale
      end

      alias_attribute :content, :body
      validates :title, :content, :publish_date, :presence => true

      friendly_id :title, :use => [:slugged]

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
          where(:publish_date => archive_date.beginning_of_month..archive_date.end_of_month)
        end

        def by_year(archive_year)
          where(:publish_date => archive_year.beginning_of_year..archive_year.end_of_year)
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
          where("publish_date < ?", item.publish_date)
        end

        def not_expired
          where(arel_table[:expiration_date].eq(nil).or(arel_table[:expiration_date].gt(Time.now)))
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
          includes(:translations).where(
            translation_class.arel_table[:locale].eq(::Globalize.locale)
          ).where(
            arel_table[:id].eq(translation_class.arel_table[:refinery_news_item_id])
          )
        end

        def teasers_enabled?
          Refinery::Setting.find_or_set(:teasers_enabled, true, :scoping => 'news')
        end

        def teaser_enabled_toggle!
          currently = Refinery::Setting.find_or_set(:teasers_enabled, true, :scoping => 'news')
          Refinery::Setting.set(:teasers_enabled, :value => !currently, :scoping => 'news')
        end
      end

    end
  end
end
