class ApiController < ApplicationController
  def find_user
    @user = User.find_by(id: params[:user_id])
  end
end
