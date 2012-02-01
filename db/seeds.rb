if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_news').blank?
      user.plugins.create(:name => 'refinerycms_news',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end

if defined?(::Refinery::Page)
  unless ::Refinery::Page.where(:menu_match => "^/news.*$").any?
    page = ::Refinery::Page.create(
      :title => "News",
      :link_url => "/news",
      :deletable => false,
      :position => ((::Refinery::Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
      :menu_match => "^/news.*$"
    )

    ::Refinery::Pages.config.default_parts.each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end
  end
end
# Refinery seeds
Dir[Rails.root.join('db', 'seeds', '*.rb').to_s].each do |file|
  puts "Loading db/seeds/#{file.split(File::SEPARATOR).last}"
  load(file)
end

# Added by RefineryCMS Pages engine
Refinery::Pages::Engine.load_seed
