class Spree::CallToAction < ActiveRecord::Base
  belongs_to :gallery_of_call_to_action
  acts_as_list scope: :gallery_of_call_to_action
  scope :by_store, lambda { |store| 
    gallery  = Spree::GalleryOfCallToAction.where(store: store).first
    gallery.call_to_actions if gallery
  }
end
