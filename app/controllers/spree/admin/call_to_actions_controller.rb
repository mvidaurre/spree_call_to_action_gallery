class Spree::Admin::CallToActionsController < Spree::Admin::ResourceController
  belongs_to 'spree/gallery_of_call_to_action', :find_by => :id
  before_action :setup_gallery_of_call_to_action

  private

    def setup_gallery_of_call_to_action
      @gallery_of_call_to_action = Spree::GalleryOfCallToAction.find params[:gallery_of_call_to_action_id]
    end

end
