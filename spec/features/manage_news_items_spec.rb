require "spec_helper"

describe "manage news items", :type => :feature do
  refinery_login

  context "when no news items" do
    it "invites to create one" do
      visit refinery.news_admin_items_path
      expect(page).to have_content("There are no news items yet. Click \"Add News Item\" to add your first news item.")
    end
  end

  describe "action links" do
    it "shows add news item link" do
      visit refinery.news_admin_items_path

      within "#actions" do
        expect(page).to have_content("Add News Item")
        expect(page).to have_selector("a[href='/#{Refinery::Core.backend_route}/news/items/new']")
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

      expect(page).to have_content("'My first news item' was successfully added.")
      expect(page.body).to match(/Remove this news item forever/)
      expect(page.body).to match(/Edit this news item/)
      expect(page.body).to match(%r{/#{Refinery::Core.backend_route}/news/items/my-first-news-item/edit})
      expect(page.body).to match(/View this news item live/)
      expect(page.body).to match(%r{/news/items/my-first-news-item})

      expect(Refinery::News::Item.count).to eq(1)
    end
  end

  describe "edit/update" do
    before { FactoryGirl.create(:news_item, :title => "Update me") }

    it "updates news item" do
      visit refinery.news_admin_items_path

      expect(page).to have_content("Update me")

      click_link "Edit this news item"

      fill_in "Title", :with => "Updated"
      click_button "Save"

      expect(page).to have_content("'Updated' was successfully updated.")
    end
  end

  describe "destroy" do
    before { FactoryGirl.create(:news_item, :title => "Delete me") }

    it "removes news item" do
      visit refinery.news_admin_items_path

      click_link "Remove this news item forever"

      expect(page).to have_content("'Delete me' was successfully removed.")

      expect(Refinery::News::Item.count).to eq(0)
    end
  end

  context "duplicate news item titles" do
    before { FactoryGirl.create(:news_item, :title => "I was here first") }

    it "isn't a problem" do
      visit refinery.new_news_admin_item_path

      fill_in "Title", :with => "I was here first"
      fill_in "Body", :with => "Doesn't matter"
      click_button "Save"

      expect(Refinery::News::Item.count).to eq(2)
    end
  end
end
