class Create<%= table_name.camelize %> < ActiveRecord::Migration

  def self.up
    create_table :<%= table_name %>, :id => true do |t|
<% attributes.each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
      t.timestamps
    end

    add_index :<%= table_name %>, :id

    <% translated_attributes = attributes.find_all { |attr| [:string, :text].include? attr.type } %>
    <%= class_name %>.create_translation_table! <%= translated_attributes.map { |a| ":#{a.name} => :#{a.type}"}.join(', ') %>
    
    load(Rails.root.join('db', 'seeds', 'refinerycms_news.rb').to_s)
  end

  def self.down
    UserPlugin.destroy_all({:name => "refinerycms_news"})

    Page.delete_all({:link_url => "/news"})

    <%= class_name %>.drop_translation_table!

    drop_table :<%= table_name %>
  end

end
