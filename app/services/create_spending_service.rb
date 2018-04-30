class CreateSpendingService < BaseService

  def initialize(params)
    super()
    @user = params[:user]
    @spending = params[:spending]
    @categories = params[:category][:categories]
  end

  def call
    create_spending
  end

  private
    def create_spending
      if @user.present?
        spending = @user.spendings.create(speding_params)
        spending.categories << category_params[:categories].map {|category| Category.create(name: category[:name])}
        if spending.errors.present?
          return spending.errors
        else
          render json: spending, status: :ok
        end
      else
        render json: set_text("User Not found", 404), status: :not_found
      end
    end

    def add_unprocessable_error(message)
      self.errors.push(message)
    end
end
