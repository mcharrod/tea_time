class Api::V1::SubscriptionsController < ApplicationController
  def create
    # add some error handling and guards to this later

    # if user.id + tea.id is valid / present 
    sub = Subscription.create(user_id: params[:user_id], tea_id: params[:tea_id], title: params[:title], annual_frequency: params[:annual_frequency], price: params[:price], status: "active")
    render json: SubscriptionsSerializer.new_tea_subscription(params)
  end

  def unsubscribe
    subscription = Subscription.find_by(id: params[:subscription_id])
    subscription.status = "inactive"
    subscription.save
    render json: Api::V1::SubscriptionsSerializer.cancel_tea_subscription(subscription)
    # unsubscribe instead of delete bc the data needs to persist
    # for the next user story
  end
end
