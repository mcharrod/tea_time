class Api::V1::SubscriptionsController < ApplicationController
  def create
    render json: SubscriptionsSerializer.new_tea_subscription(params)
  end
end
