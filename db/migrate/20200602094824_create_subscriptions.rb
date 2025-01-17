class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :product, null: false, foreign_key: true
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
