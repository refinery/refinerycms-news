require "spec_helper"

module Refinery
  module News
    describe ItemsController do
      let!(:item) { FactoryGirl.create(:news_item) }
      let(:page) { Refinery::Page.where(:link_url => "/news").first }

      describe "#index" do
        it "assigns items and page" do
          get :index
          assigns(:items).first.should eq(item)
          assigns(:page).should eq(page)
        end

        it "renders 'index' template" do
          get :index
          response.should render_template(:index)
        end
      end

      describe "#show" do
        it "assigns item and page" do
          get :show, :id => item.id
          assigns(:item).should eq(item)
          assigns(:page).should eq(page)
        end

        it "renders 'show' template" do
          get :show, :id => item.id
          response.should render_template(:show)
        end
      end

      describe "#archive" do
        context "when month is present" do
          it "assigns archive_date and items" do
            Refinery::News::Item.stub_chain(:live, :by_archive, :page).and_return(item)
            get :archive, :month => 05, :year => 1999
            assigns(:archive_date).should eq(Time.parse("05/1999"))
            assigns(:items).should eq(item)
          end
        end

        context "when month isnt present" do
          it "assigns archive_date and items" do
            Refinery::News::Item.stub_chain(:live, :by_year, :page).and_return(item)
            get :archive, :year => 1999
            assigns(:archive_date).should eq(Time.parse("01/1999"))
            assigns(:items).should eq(item)
          end
        end

        it "renders 'archive' template" do
          get :archive, :year => 1999
          response.should render_template(:archive)
        end

        it "assigns page" do
          get :archive, :year => 1999
          assigns(:page).should eq(page)
        end
      end
    end
  end
end
