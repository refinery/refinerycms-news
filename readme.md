# News

![Refinery News](http://refinerycms.com/system/images/0000/0876/news.png)

## About

__Refinery's news engine allows you to post updates to the news section of your website.__

Key features:

* Default news page shows a summary of recent news posts
* Detail view shows the full post and also linked to recent news on the "side bar"

## Requirements

[RefineryCMS](http://refinerycms.com) "core" engine version 0.9.9.15 or later.

### Gem Installation using Bundler (The very best way)

Include the latest [gem](http://rubygems.org/gems/refinerycms-news) into your Refinery CMS application's Gemfile:

    gem "refinerycms-news", '~> 1.1'

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install
    rails generate refinerycms_news
    rake db:migrate

## Customising the views

Type this command at your project root to override the default front end views:

    $ rake refinery:override view=news_items/*
    Copied view template file to app/views/news_items/_recent_posts.html.erb
    Copied view template file to app/views/news_items/index.html.erb
    Copied view template file to app/views/news_items/show.html.erb

## RSS (Really Simple Syndication)

To get RSS for your entire site, insert this into the head section of your layout after installing:

    <%= auto_discovery_link_tag(:rss, news_items_url(:format => 'rss')) %>