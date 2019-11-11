require "spec_helper"

module Refinery
  module News
    describe ItemsController, :type => :controller do
      let!(:item) { FactoryBot.create(:news_item) }
      let(:refinery_page) { Refinery::Page.where(:link_url => "/news").first }

      describe "#index" do
        it "assigns items and page" do
          get :index
          expect(assigns(:items).first).to eq(item)
          expect(assigns(:page)).to eq(refinery_page)
        end

        it "renders 'index' template" do
          get :index
          expect(response).to render_template(:index)
        end
      end

      describe "#show" do
        it "assigns item and page" do
          get :show, :id => item.id
          expect(assigns(:item)).to eq(item)
          expect(assigns(:page)).to eq(refinery_page)
        end

        it "renders 'show' template" do
          get :show, :id => item.id
          expect(response).to render_template(:show)
        end
      end

      describe "#archive" do
        context "when month is present" do
          it "assigns archive_date and items" do
            allow(Refinery::News::Item).to receive_message_chain(:archived, :translated, :by_archive, :page).and_return(item)
            get :archive, :month => 05, :year => 1999
            expect(assigns(:archive_date)).to eq(Time.parse("05/1999"))
            expect(assigns(:items)).to eq(item)
            expect(assigns(:archive_for_month)).to be_truthy
          end
        end

        context "when month isnt present" do
          it "assigns archive_date and items" do
            allow(Refinery::News::Item).to receive_message_chain(:archived, :translated, :by_year, :page).and_return(item)
            get :archive, :year => 1999
            expect(assigns(:archive_date)).to eq(Time.parse("01/1999"))
            expect(assigns(:items)).to eq(item)
          end
        end

        it "renders 'archive' template" do
          get :archive, :year => 1999
          expect(response).to render_template(:archive)
        end

        it "assigns page" do
          get :archive, :year => 1999
          expect(assigns(:page)).to eq(refinery_page)
        end
      end
    end
  end
end
