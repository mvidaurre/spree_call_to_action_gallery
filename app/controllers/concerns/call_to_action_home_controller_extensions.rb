module CallToActionHomeControllerExtensions
  extend ActiveSupport::Concern

  included do
    singleton_class.prepend ClassMethods
    prepend InstanceMethods
  end

  module ClassMethods

  end

  module InstanceMethods
    def index
      super
      @call_to_actions = Spree::CallToAction.by_store(Spree::Store.current)
    end
  end

end