class UserService < BaseService

  def initialize(params)
    super()
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
  end

  def call
    create_user
  end

  private
    def create_user
      user = User.create(name: @name, email: @email, password: hash_password(@password))
      if user.errors.present?
        add_unprocessable_error(user.errors.full_messages)
        return self
      else
        user
      end
    end

    def hash_password(password)
      BCrypt::Password.create(password).to_s
    end

end

