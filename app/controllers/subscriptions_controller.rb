class SubscriptionsController < ApplicationController 
    before_action :authenticate_user!
    def index
    end

    def create
        @subscription = Subscription.new(subscription_params)
        puts "Subscribing to topic product_id#{params[:product_id]}"
        topic = SNS.topic("arn:aws:sns:eu-west-1:645069479050:product_id-#{params[:product_id]}")

        @user = current_user
        @subscription.user = @user
        sub = topic.subscribe({
            protocol: 'sms',
            endpoint: @user.phone,
        })

        @subscription.aws_subscription_id = sub.arn
        @subscription.save
        flash[:info] = "Successfully subscribed!"
        redirect_to subscriptions_path
    end

    def destroy
        @subscription = Subscription.find(params[:id])
        res = SNS.client.unsubscribe({
            'subscription_arn': @subscription.aws_subscription_id
        })
        @subscription.destroy
      
        redirect_to subscriptions_path
    end

    def show    
        @subscription = Subscription.find(params[:id])
    end
    private
        def subscription_params
            params.permit(:product_id)
        end
end
