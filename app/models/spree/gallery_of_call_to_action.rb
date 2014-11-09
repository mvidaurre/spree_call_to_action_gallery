class Spree::GalleryOfCallToAction < ActiveRecord::Base
  belongs_to :store
  has_many :call_to_actions
  scope :by_store, lambda { |store| where(store: store) }
end
