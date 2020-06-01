class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :url
      t.string :image_url
      t.integer :variant_id
      t.references :store, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.boolean :in_stock
      t.boolean :active

      t.timestamps
    end
  end
end
