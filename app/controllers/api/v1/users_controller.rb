class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!({first_name: params[:first_name], last_name: params[:last_name], email: params[:email], address: params[:address]})

    render json: { user_id: user.id, first_name: user.first_name }
  end
end
