class UserService

  def initialize(params)
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
  end

  def call
    create_user
  end

  private
    def create_user
      user = User.create(name: @name, email: @email, password: @password)
      if user.errors.present?
        error_response user
      else
        success_response user
      end
    end


    def error_response(param)
      {
        status: 400,
        data: {
          errors: param.errors.full_messages
        }
      }
    end

    def success_response(param)
      {
        status: 200,
        data: {
          user: {
            name: param.name,
            email: param.email
          }
        }
      }
    end
end

