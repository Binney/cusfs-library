require 'spec_helper'

describe "Item pages" do

  subject { page }
  
  describe "index" do

    describe "pagination" do

      before(:all) { 35.times { FactoryGirl.create(:item) } }
      after(:all)  { Item.delete_all }

      it { should have_selector('div.pagination') }
      it "should list each item" do
        Item.paginate(page: 1).each do |item|
          expect(page).to have_selector('li', text: item.title)
        end
      end

    end
  end
  
  describe "show page" do
    let(:item) { FactoryGirl.create(:item) }
    before { visit item_path(item) }

    it { should have_content(item.title) }
    it { should have_title(item.title) }
  end

  describe "create item page" do
    before { visit new_item_path }

    let(:submit) { "Add to Library" }

    it {should have_field "Title"}
    it {should have_field "Author"}

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