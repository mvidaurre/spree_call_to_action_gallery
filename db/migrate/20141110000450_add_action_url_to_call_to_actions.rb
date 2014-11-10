class AddActionUrlToCallToActions < ActiveRecord::Migration
  def change
    add_column :spree_call_to_actions, :action_url, :string
  end
end
