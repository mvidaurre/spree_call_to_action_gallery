FactoryGirl.define do
  factory :call_to_action, class: Spree::CallToAction do
    title { generate(:random_string) }
    description  { generate(:random_description) }
    action "Call to Action"
    action_url "/call_to_action"
    sequence(:picture_url) { |n| "/images/call_to_action#{n}" }
  end
end