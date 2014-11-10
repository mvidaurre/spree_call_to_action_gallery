FactoryGirl.define do
  factory :gallery_of_call_to_action, class: Spree::GalleryOfCallToAction do
    name { generate(:random_string) }
    description  { generate(:random_description) }
    max_call_to_actions_count 5
    store
  end
end