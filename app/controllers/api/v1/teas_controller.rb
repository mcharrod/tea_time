class Api::V1::TeasController < ApplicationController
  def index
    render json: Api::V1::TeasSerializer.list_all_teas
  end
end
