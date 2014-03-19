require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
	before { visit root_path }  	

    it { should have_content('CUSFS Library') }
    it { should have_title(full_title('Home')) }

  end

  describe "Committee page" do
  	before { visit committee_path }

    it { should have_content('Committee') }
    it { should have_title(full_title('Committee')) }

  end

  describe "Help page" do
  	before {visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }

  end

  describe "Contact page" do
  	before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }

  end
end