class Api::V1::SpendingsController < ApiController
  before_action :find_user

  def index
    spendings = @user.spendings
    if spendings.present?
      render json: spendings, status: :ok
    end
  end

  def create
    service_response = CreateSpendingService.new({user: @user, spending: spending_params, category: category_params}).call
  end

  def show
    spending = Spending.find_by(id: params[:id])
    render json: set_response(spending), status: :ok
  end

  def destroy
    spending = Spending.find_by(id: params[:id])
    if spending.present?
      if spending.destroyed?
        render json: '', status: :ok
      else
        render json: set_text("Unprocessable entity",  422), status: :unprocessable_entity
      end
    else
      render json: set_text("Spending Not found", 400), status: :not_found
    end
  end

  def update
    spending = Spending.find_by(id: params[:id])
    spending.update(spending_params)
    # TODO
    # spending.categories.create()
    render json: spending, status: :ok
  end

  private
    def spending_params
      params.require(:spending).permit(:description, :value)
    end

    def category_params
      params.permit(categories: [:name])
    end

    def set_response(param)
      {
        spending: param,
        categories: param.categories
      }
    end

    def set_text(message, status)
      {
        stats: status,
        message: message
      }
    end
end
