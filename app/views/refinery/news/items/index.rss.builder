xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    # Required to pass W3C validation.
    xml.atom :link, nil, {
      :href => refinery.news_items_url(:format => 'rss'),
      :rel => 'self', :type => 'application/rss+xml'
    }

    # Feed basics.
    xml.title             page_title
    xml.description       @page[:body].to_s.gsub(/<\/?[^>]*>/, "") # .to_s protects from nil errors
    xml.link              refinery.news_items_url(:format => 'rss')

    # News items.
    @items.each do |news_item|
      xml.item do
        xml.title         news_item.title
        xml.link          refinery.news_item_url(news_item)
        xml.description   truncate(news_item.body, :length => 200, :preserve_html_tags => true)
        xml.pubDate       news_item.publish_date.to_s(:rfc822)
        xml.guid          refinery.news_item_url(news_item)
      end
    end
  end
end