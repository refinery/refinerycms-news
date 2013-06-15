require "spec_helper"

describe "manage news items" do
  refinery_login_with :refinery_user

  context "when no news items" do
    it "invites to create one" do
      visit refinery.news_admin_items_path
      page.should have_content("There are no news items yet. Click \"Add News Item\" to add your first news item.")
    end
  end

  describe "action links" do
    it "shows add news item link" do
      visit refinery.news_admin_items_path

      within "#actions" do
        page.should have_content("Add News Item")
        page.should have_selector("a[href='/#{Refinery::Core.backend_route}/news/items/new']")
      end
    end
  end

  describe "new/create" do
    it "allows to create news item" do
      visit refinery.news_admin_items_path

      click_link "Add News Item"

      fill_in "Title", :with => "My first news item"
      fill_in "Body", :with => "bla bla"
      fill_in "Source", :with => "http://refinerycms.com"
      click_button "Save"

      page.should have_content("'My first news item' was successfully added.")
      page.body.should =~ /Remove this news item forever/
      page.body.should =~ /Edit this news item/
      page.body.should =~ %r{/#{Refinery::Core.backend_route}/news/items/my-first-news-item/edit}
      page.body.should =~ /View this news item live/
      page.body.should =~ %r{/news/items/my-first-news-item}

      Refinery::News::Item.count.should == 1
    end
  end

  describe "edit/update" do
    before(:each) { Factory(:news_item, :title => "Update me") }

    it "updates news item" do
      visit refinery.news_admin_items_path

      page.should have_content("Update me")

      click_link "Edit this news item"

      fill_in "Title", :with => "Updated"
      click_button "Save"

      page.should have_content("'Updated' was successfully updated.")
    end
  end

  describe "destroy" do
    before(:each) { Factory(:news_item, :title => "Delete me") }

    it "removes news item" do
      visit refinery.news_admin_items_path

      click_link "Remove this news item forever"

      page.should have_content("'Delete me' was successfully removed.")

      Refinery::News::Item.count.should == 0
    end
  end

  context "duplicate news item titles" do
    before(:each) { Factory(:news_item, :title => "I was here first") }

    it "isn't a problem" do
      visit refinery.new_news_admin_item_path

      fill_in "Title", :with => "I was here first"
      fill_in "Body", :with => "Doesn't matter"
      click_button "Save"

      Refinery::News::Item.count.should == 2
    end
  end
end
