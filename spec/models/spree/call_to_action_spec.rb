require 'rails_helper'

RSpec.describe Spree::CallToAction, :type => :model do
  let!(:call_to_action) { create(:call_to_action) }

  context 'factory' do
    it 'is valid' do
      expect(call_to_action).to be_valid
    end
  end

  context "call_to_actions in stores" do
    let(:store) {create(:store)}
    let(:gallery_of_call_to_action) {create(:gallery_of_call_to_action, store: store)}
    let(:call_to_action) {create(:call_to_action, gallery_of_call_to_action: gallery_of_call_to_action)}
    let(:call_to_action2) {create(:call_to_action)}

    it 'should correctly find call_to_actions by store' do
      call_to_actions_by_store = Spree::CallToAction.by_store(store)
      expect(call_to_actions_by_store).to include(call_to_action)
      expect(call_to_actions_by_store).to_not include(call_to_action2)
    end

  end
end
