# Refinery CMS News

[![Build Status](https://travis-ci.org/refinery/refinerycms-news.svg?branch=master)](https://travis-ci.org/refinery/refinerycms-news)

## About

__Refinery's news engine allows you to post updates to the news section of your website.__

Key features:

* Default news page shows a summary of recent news posts
* Detail view shows the full post and also linked to recent news on the "side bar"

## Requirements

[Refinery CMS](http://refinerycms.com) "core" engine version 2.0.0 or later.

### Gem Installation using Bundler (The very best way)

Include the latest [gem](http://rubygems.org/gems/refinerycms-news) into your Refinery CMS application's Gemfile:

```ruby
gem "refinerycms-news", '~> 2.1.0'
```

Then type the following at command line inside your Refinery CMS application's root directory:

    bundle install
    rails generate refinery:news
    rake db:migrate
    rake db:seed

## How to display a news feed on the homepage:

Assuming you've already overridden the homepage view:

    $ rake refinery:override view=refinery/pages/home

You can render the `recent_posts` partial. However, you will need to set the recent News items manually, since this is normally handled in the News::Items controller:

```erb
<% @items = Refinery::News::Item.latest(5) %>
<%= render :partial => '/refinery/news/items/recent_posts' %>
```

## Configuring the number of items per page

To modify the number of items per page for the news items index without
affecting the archive page you must override the method in the controller that
sets `@items` for the index: `find_published_news_items`.

Currently the method body is:
```ruby
@items = Item.published.translated.page(params[:page])
```

The `page` convenience method needs to be replaced with `paginate` and
`per_page` passed as an option.  Add a decorator for the items controller with
the following contents:

```ruby
module Refinery::News
  ItemsController.class_eval do
    def find_published_news_items
      @items = Item.published.translated.paginate :page => params[:page],
                                                  :per_page => 8
    end
  end
end
```

## Customising the views

Type this command at your project root to override the default front end views:

    $ rake refinery:override view=refinery/news/items/*
    Copied view template file to app/views/refinery/news/items/_recent_posts.html.erb
    Copied view template file to app/views/refinery/news/items/index.html.erb
    Copied view template file to app/views/refinery/news/items/show.html.erb
    etc.

## RSS (Really Simple Syndication)

To get RSS for your entire site, insert this into the head section of your layout after installing:

```erb
<%= auto_discovery_link_tag(:rss, refinery.news_items_url(:format => 'rss')) %>
```

## More Information
* Check out our [Website](http://refinerycms.com/)
* Refinery Documentation is available in the [guides](http://refinerycms.com/guides)
* Questions can be asked on our [Google Group](http://group.refinerycms.org)
* Questions can also be asked in our IRC room, [#refinerycms on freenode](irc://irc.freenode.net/refinerycms)
