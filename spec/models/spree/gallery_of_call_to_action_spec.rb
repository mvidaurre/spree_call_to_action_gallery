require 'rails_helper'

RSpec.describe Spree::GalleryOfCallToAction, :type => :model do
  let!(:gallery_of_call_to_action) { create(:gallery_of_call_to_action) }

  context 'factory' do
    it 'is valid' do
      expect(gallery_of_call_to_action).to be_valid
    end
  end

  context "gallery_of_call_to_action in stores" do
    before(:each) do
      @store = create(:store, name: 'Free the Whales', url: 'freethewhales.com')
      @gallery_of_call_to_action = create(:gallery_of_call_to_action, store: @store)
      @gallery_of_call_to_action2 = create(:gallery_of_call_to_action)
    end

    it 'should correctly find call_to_actions by store' do
      gallery_of_call_to_action_by_store = Spree::GalleryOfCallToAction.by_store(@store)
      expect(gallery_of_call_to_action_by_store).to include(@gallery_of_call_to_action)
      expect(gallery_of_call_to_action_by_store).to_not include(@gallery_of_call_to_action2)
    end
  end
end
