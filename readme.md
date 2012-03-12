# News

![Refinery News](http://refinerycms.com/system/images/0000/0876/news.png)

## About

__Refinery's news engine allows you to post updates to the news section of your website.__

Key features:

* Default news page shows a summary of recent news posts
* Detail view shows the full post and also linked to recent news on the "side bar"

## Requirements

[Refinery CMS](http://refinerycms.com) "core" engine version 2.0.0 or later.

### Gem Installation using Bundler (The very best way)

Include the latest [gem](http://rubygems.org/gems/refinerycms-news) into your Refinery CMS application's Gemfile:

    gem "refinerycms-news", '~> 2.0.0'

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install
    rails generate refinery:news
    rake db:migrate
    rake db:seed

## Customising the views

Type this command at your project root to override the default front end views:

    $ rake refinery:override view=refinery/news/items/*
    Copied view template file to app/views/refinery/news/items/_recent_posts.html.erb
    Copied view template file to app/views/refinery/news/items/index.html.erb
    Copied view template file to app/views/refinery/news/items/show.html.erb
    etc.

## RSS (Really Simple Syndication)

To get RSS for your entire site, insert this into the head section of your layout after installing:

    <%= auto_discovery_link_tag(:rss, refinery.news_items_url(:format => 'rss')) %>