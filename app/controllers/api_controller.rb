class ApiController < ApplicationController
  def find_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_response(status, message)
    {
      status: status,
      data: message
    }

  end
end
