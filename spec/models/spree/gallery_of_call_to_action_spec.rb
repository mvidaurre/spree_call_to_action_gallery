require 'rails_helper'

RSpec.describe Spree::GalleryOfCallToAction, :type => :model do
  let!(:gallery_of_call_to_action) { create(:gallery_of_call_to_action) }

  context 'factory' do
    it 'is valid' do
      expect(gallery_of_call_to_action).to be_valid
    end
  end
end
