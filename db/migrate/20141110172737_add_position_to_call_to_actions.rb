class AddPositionToCallToActions < ActiveRecord::Migration
  def change
    add_column :spree_call_to_actions, :position, :integer
  end
end
