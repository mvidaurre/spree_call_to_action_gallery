Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :gallery_of_call_to_actions do
      resources :call_to_actions
    end
  end
end
