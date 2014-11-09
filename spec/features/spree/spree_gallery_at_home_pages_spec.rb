require 'rails_helper'

feature "Spree::GalleryAtHomePages", :type => :feature do
  context 'visitor in homepage' do
    before do
      visit "/"
    end

    it "should see the call to action" do
      expect(page).to have_content("Call to Action")
    end
  end
end
