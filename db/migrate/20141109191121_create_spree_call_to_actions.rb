class CreateSpreeCallToActions < ActiveRecord::Migration
  def change
    create_table :spree_call_to_actions do |t|
      t.string :title
      t.text :description
      t.string :action
      t.string :picture_url
      t.belongs_to :gallery_of_call_to_action, index: true

      t.timestamps
    end
  end
end
