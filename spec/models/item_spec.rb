require 'spec_helper'

describe Item do

  before do 
  	@item = Item.new(title: "The Nife and Accurate Prophefies of Agnes Nutter", author: "Agnes Nutter")
  end 

  subject { @item }

  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:medium) }

  describe "when title is not present" do
  	before { @item.title = "" }
  	it { should_not be_valid }
  end
  
end