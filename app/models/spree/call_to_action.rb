class Spree::CallToAction < ActiveRecord::Base
  belongs_to :gallery_of_call_to_action
  scope :by_store, lambda { |store| Spree::GalleryOfCallToAction.where(store: store).first.call_to_actions }
end
