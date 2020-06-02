class AddAwsSubscriptionIdToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :aws_subscription_id, :string
  end
end
