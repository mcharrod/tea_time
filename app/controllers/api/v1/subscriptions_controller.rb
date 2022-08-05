class Api::V1::SubscriptionsController < ApplicationController
  def create
    # add some error handling and guards to this later

    # if user.id + tea.id is valid / present
    sub = Subscription.find_or_create_by!(user_id: params[:user_id], tea_id: params[:tea_id], title: params[:title], annual_frequency: params[:annual_frequency], price: params[:price], status: "active")
    render json: Api::V1::SubscriptionsSerializer.new_tea_subscription(params, sub)
  end

  def unsubscribe
    subscription = Subscription.find(params[:subscription_id])
    subscription.status = "cancelled"
    subscription.save
    render json: Api::V1::SubscriptionsSerializer.cancel_tea_subscription(subscription)
    # unsubscribe instead of delete bc the data needs to persist
    # for the next user story
  end

  def index
    user = User.find_by(id: params[:user_id])
    render json: Api::V1::SubscriptionsSerializer.show_all_subscriptions(user)
  end
end
