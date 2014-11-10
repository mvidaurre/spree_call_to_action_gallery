require 'rails_helper'

feature "Spree::GalleryAtHomePages", :type => :feature do
  context 'visitor in homepage' do
    let(:store) {create(:store, default: true, url: 'spreecommerce.com')}
    let(:gallery_of_call_to_action) {create(:gallery_of_call_to_action, store: store)}
    let(:call_to_action) {create(:call_to_action, gallery_of_call_to_action: gallery_of_call_to_action)}
    let(:call_to_action_subscribe) {create(:call_to_action, action: "Subscribe", action_url: "/signup")}
    let(:call_to_action_purchase) {create(:call_to_action, action: "Purchase", action_url: "/cart")}

    before do
      call_to_action
      visit "/"
    end

    it "should see the call to action" do
      expect(page).to have_content("Call to Action")
    end

    it "should see the title" do
      expect(page).to have_content(call_to_action.title)
    end

    context 'several call to action' do
      before do
        gallery_of_call_to_action.call_to_actions << call_to_action_subscribe
        gallery_of_call_to_action.call_to_actions << call_to_action_purchase
        visit "/"
      end
      it "should see all the call to actions" do   
        expect(page).to have_content("Call to Action")
        expect(page).to have_content("Subscribe")
        expect(page).to have_content("Purchase")      
      end
      it "should be able for clicking in a call to action" do
        click_on "Subscribe"
        expect(current_path).to eql(spree.signup_path)
        visit "/"
        click_on "Purchase"
        expect(current_path).to eql(spree.cart_path)
      end
    end
  end
end
