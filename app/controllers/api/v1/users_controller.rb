class Api::V1::UsersController < ApplicationController

  def new
    User.create(user_params)
  end

  def create
    service = UserService.new(user_params).call
    debugger
    render json: service
  end

  def show
  end

  def delete
  end

  def update
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end