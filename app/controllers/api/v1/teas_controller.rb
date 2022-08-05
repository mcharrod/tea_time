class Api::V1::TeasController < ApplicationController
  def index
    render json: TeasSerializer.list_all_teas
  end
end
