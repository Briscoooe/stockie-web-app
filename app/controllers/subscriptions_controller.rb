class SubscriptionsController < ApplicationController 
    def index
    end

    def create
        @subscription = Subscription.new(subscription_params)
        topic = SNS.topic("arn:aws:sns:eu-west-1:645069479050:product_id-#{params[:product_id]}")

        @user = User.find(params[:user_id])
        sub = topic.subscribe({
            protocol: 'sms',
            endpoint: @user.phone,
        })

        @subscription.aws_subscription_id = sub.arn

        @subscription.save
        flash[:info] = "Successfully subscribed!"
        render 'subscriptions/index'
    end

    def destroy
        @subscription = Subscription.find(params[:id])
        topic = SNS.topic(@subscription.aws_subscription_id)
        topic.unsubscribe
        @subscription.destroy
      
        redirect_to user_subscriptions_path
    end

    def show    
        @subscription = Subscription.find(params[:id])
    end
    private
        def subscription_params
            params.permit(:product_id, :user_id)
        end
end
