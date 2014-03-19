require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
  	
    it "should have the content 'CUSFS Library'" do
      visit '/static_pages/home'
      expect(page).to have_content('CUSFS Library')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("CUSFS Library | Home")
    end
  end

  describe "Committee page" do

    it "should have the content 'Committee'" do
      visit '/static_pages/committee'
      expect(page).to have_content('Committee')
    end

    it "should have the title 'Committee'" do
      visit '/static_pages/committee'
      expect(page).to have_title("CUSFS Library | Committee")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("CUSFS Library | Help")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("CUSFS Library | Contact")
    end
  end
end