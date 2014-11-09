class CreateSpreeGalleryOfCallToActions < ActiveRecord::Migration
  def change
    create_table :spree_gallery_of_call_to_actions do |t|
      t.string :name
      t.text :description
      t.integer :max_call_to_actions_count
      t.belongs_to :store, index: true

      t.timestamps
    end
  end
end
