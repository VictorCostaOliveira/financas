class Api::V1::SpendingsController < ApiController
  before_action :find_spending, except: :index

  def index
    spendings = current_user.spendings
    if spendings.present?
      render json: set_response(200, serialize_resource_list(spendings, SpendingSerializer)), status: :ok
    else
      render json: set_response(204, "No content"), stauts: :no_content
    end
  end

  def create
    service_response = CreateSpendingService.new({user: current_user, spending: spending_params, category: category_params}).call
    if service_response.errors.present?
      render json: set_response(422, service_response.errors), status: :unprocessable_entity
    else
      render json: set_response(201, serialize_resource(service_response, SpendingSerializer))
    end
  end

  def show
    if @spending.present?
      render json: set_response(200, serialize_resource(@spending, SpendingSerializer)), status: :ok
    else
      render json: set_response(404, "Expense not found"), stauts: :not_found
    end
  end

  def destroy
    if @spending.present?
      @spending.destroy@spending
      return render json: set_response("Expense had been deleted"), status: :ok if @spending.destroyed?
      render json: set_response(422, "Unprocessable entity"), status: :unprocessable_entity
    else
      render json: set_response(400, "Expense Not found"), status: :not_found
    end
  end

  def update

    if @spending.present?
      return render json: set_response(200, serialize_resource(@spending, SpendingSerializer)), status: :ok if @spending.update(spending_params)
      render json: set_response(422, @spending.errors.full_messages), status: :ok
    else
      render json: set_response(404, "Expense not found")
    end
  end

  private

    def find_spending
      @spending = current_user.spendings.find_by(id: params[:id])
    end
    def spending_params
      params.require(:spending).permit(:description, :value)
    end

    def category_params
      params.permit(categories: [:name])
    end
end
