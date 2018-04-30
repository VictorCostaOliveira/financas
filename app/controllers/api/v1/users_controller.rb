class Api::V1::UsersController < ApiController

  def new
    User.create(user_params)
  end

  def create
    service = UserService.new(user_params).call
    render json: service
  end

  def show
    render json: find_user, status: :ok
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
