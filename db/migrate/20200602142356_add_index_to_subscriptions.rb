class AddIndexToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_index :subscriptions, [:user_id, :product_id], unique: true
  end
end
