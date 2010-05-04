# News

![Refinery News](http://refinerycms.com/system/images/0000/0646/news.png)

## About

__Refinery's news plugin allows you to post updates to the news section of your website.__

Key features:

* Default news page shows a summary of recent news posts
* Detail view shows the full post and also linked to recent news on the "side bar"

## How do I use it?

To install the news plugin, you can either include the gem or install as a plugin.

### Installation via Gem

Include the latest (gem)[http://rubygems.org/gems/refinerycms-news] into your config/application.rb file like so:

    config.gem "refinerycms-news", :lib => "news", :source => "rubygems.org", :version => "~> 0.9.7.1"

Then type the following at command line inside your Refinery CMS application's root directory:

    rake gems:install
    script/generate news
    rake db:migrate

### Installation as a plugin

Inside your Refinery CMS application's root directory, type this at command line:

    script/plugin install git://github.com/resolve/refinerycms-news.git
    script/generate news
    rake db:migrate

## RSS (Really Simple Syndication)

To get RSS for your entire site, insert this into the head section of your layout after installing:

    <%= auto_discovery_link_tag(:rss, news_items_url(:format => 'rss')) %>