class Api::V1::UsersController < ApiController

  def sign_in
    @user = User.find_by(email: user_params[:email])
    if @user && test_password(user_params[:password], @user.password)
      render json: set_response(200, serialize_resource(@user, UserSerializer)), status: :ok
    else
      render json: set_response(422, "Username or password was incorrect"), stauts: :unprocessable_error
    end
  end

  def create
    user = UserService.new(user_params).call
    if user.errors.present?
      render json: set_response(422, user.errors), status: :unprocessable_error
    else
      render json: set_response(201, serialize_resource(user, UserSerializer)), status: :created
    end
  end

  def show
    if current_user.present?
      render json: set_response(200, serialize_resource(current_user, UserSerializer)), status: :ok
    else
      render json: set_response(404, "User not found"), status: :not_found
    end
  end

  # def delete
  # end

  # def update
  # end

  def sign_out
    @current_user = nil
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def user_login_params
      params.require(:user).permit(:email, :password)
    end
end
