class RemovePhoneFromSubscriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :subscriptions, :phone, :string
  end
end
