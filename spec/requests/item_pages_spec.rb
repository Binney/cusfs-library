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

    it { should have_content('New entry') }
    it { should have_title(full_title('New entry')) }
  end
end