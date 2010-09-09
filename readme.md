# News

![Refinery News](http://refinerycms.com/system/images/0000/0876/news.png)

## About

__Refinery's news engine allows you to post updates to the news section of your website.__

Key features:

* Default news page shows a summary of recent news posts
* Detail view shows the full post and also linked to recent news on the "side bar"

## How do I use it?

To install the news engine, you can either include the gem or install as a plugin.

## Requirements

[RefineryCMS](http://refinerycms.com) version 0.9.8 or later.

### Gem Installation using Bundler (The very best way)

Include the latest [gem](http://rubygems.org/gems/refinerycms-news) into your Refinery CMS application's Gemfile:

    gem "refinerycms-news", '~> 0.9.9'

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install
    rails generate refinerycms_news
    rake db:migrate

## RSS (Really Simple Syndication)

To get RSS for your entire site, insert this into the head section of your layout after installing:

    <%= auto_discovery_link_tag(:rss, news_items_url(:format => 'rss')) %>