class Users::UsersController < ApplicationController
  respond_to :json

  def user
    render json: current_user
  end
end
