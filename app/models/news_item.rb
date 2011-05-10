class NewsItem < ActiveRecord::Base
  belongs_to :image, :class_name => 'Image'

  translates :title, :body, :external_url
  
  attr_accessor :locale # to hold temporarily

  alias_attribute :content, :body
  validates_presence_of :title, :content, :publish_date

  has_friendly_id :title, :use_slug => true

  acts_as_indexed :fields => [:title, :body]

  default_scope :order => "publish_date DESC"

  # If you're using a named scope that includes a changing variable you need to wrap it in a lambda
  # This avoids the query being cached thus becoming unaffected by changes (i.e. Time.now is constant)
  scope :not_expired, lambda {
    news_items = Arel::Table.new(NewsItem.table_name)
    where(news_items[:expiration_date].eq(nil).or(news_items[:expiration_date].gt(Time.now)))
  }
  scope :published, lambda {
    not_expired.where("publish_date < ?", Time.now)
  }
  scope :latest, lambda { |*l_params|
    published.limit( l_params.first || 10)
  }

  # rejects any page that has not been translated to the current locale.
  scope :translated, lambda {
    pages = Arel::Table.new(NewsItem.table_name)
    translations = Arel::Table.new(NewsItem.translations_table_name)

    includes(:translations).where(
      translations[:locale].eq(Globalize.locale)).where(pages[:id].eq(translations[:news_item_id]))
  }

  def not_published? # has the published date not yet arrived?
    publish_date > Time.now
  end

  # for will_paginate
  def self.per_page
    20
  end

end
