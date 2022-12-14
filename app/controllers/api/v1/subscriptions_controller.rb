class Api::V1::SubscriptionsController < ApplicationController
  def create
    # add some error handling and guards to this later

    # if user.id + tea.id is valid / present
    sub_checker = Subscription.find_by(user_id: params[:user_id], tea_id: params[:tea_id])

    if sub_checker.present?
      sub_checker.status = "active"
      sub_checker.save
      render json: Api::V1::SubscriptionsSerializer.new_tea_subscription(params, sub_checker)
    else
      sub = Subscription.create!(user_id: params[:user_id], tea_id: params[:tea_id], title: params[:title], frequency: params[:frequency], price: params[:price], status: "active")
      render json: Api::V1::SubscriptionsSerializer.new_tea_subscription(params, sub)
    end
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
