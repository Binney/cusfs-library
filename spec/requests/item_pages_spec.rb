require 'spec_helper'

describe "Item pages" do

  subject { page }

  describe "show page" do
    let(:item) { FactoryGirl.create(:item) }
    before { visit item_path(item) }

    it { should have_content(item.title) }
    it { should have_title(item.title) }
  end

  describe "create item page" do
    before { visit new_item_path }

    let(:submit) { "Add to Library" }

    describe "with invalid information" do
      it "should not create an entry in the database" do
        expect { click_button submit }.not_to change(Item, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Title",         with: "The Seventh Black Book"
        fill_in "Author",        with: "Nekron"
        fill_in "Date", with: "2006"
      end

      it "should create an entry in the database" do
        expect { click_button submit }.to change(Item, :count).by(1)
      end
    end

  end
end