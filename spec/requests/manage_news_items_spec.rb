require "spec_helper"

describe "manage news items" do
  login_refinery_user

  context "when no news items" do
    it "invites to create one" do
      visit refinery_admin_news_items_path
      page.should have_content("There are no news items yet. Click \"Add News Item\" to add your first news item.")
    end
  end

  describe "action links" do
    it "shows add news item link" do
      visit refinery_admin_news_items_path

      within "#actions" do
        page.should have_content("Add News Item")
        page.should have_selector("a[href='/refinery/news/new']")
      end
    end
  end

  describe "new/create" do
    it "allows to create news item" do
      visit refinery_admin_news_items_path

      click_link "Add News Item"

      fill_in "Title", :with => "My first news item"
      fill_in "Body", :with => "bla bla"
      click_button "Save"

      page.should have_content("'My first news item' was successfully added.")
      page.body.should =~ /Remove this news item forever/
      page.body.should =~ /Edit this news item/
      page.body.should =~ /\/refinery\/news\/my-first-news-item\/edit/
      page.body.should =~ /View this news item live/
      page.body.should =~ /\/news\/my-first-news-item/

      Refinery::NewsItem.count.should == 1
    end
  end

  describe "edit/update" do
    before(:each) { Factory(:news_item, :title => "Update me") }

    it "updates news item" do
      visit refinery_admin_news_items_path

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
      visit refinery_admin_news_items_path

      click_link "Remove this news item forever"

      page.should have_content("'Delete me' was successfully removed.")

      Refinery::NewsItem.count.should == 0
    end
  end

  context "duplicate news item titles" do
    before(:each) { Factory(:news_item, :title => "I was here first") }

    it "isn't a problem" do
      visit new_refinery_admin_news_item_path

      fill_in "Title", :with => "I was here first"
      fill_in "Body", :with => "Doesn't matter"
      click_button "Save"

      Refinery::NewsItem.count.should == 2
    end
  end
end
