class Api::V1::EarningsController < ApiController
  before_action :find_earning, except: [:index]

  def index
    earnings = current_user.earnings
    return render json: set_response(200, serialize_resource_list(earnings, EarningSerializer)), status: :ok if earnings.present?
    render json: set_response(204, "No content"), status: :no_content
  end

  def create
    earning = current_user.earnings.create(earning_params)
    return render json: set_response(422, earning.errors.full_messages), status: :unprocessable_entity if earning.errors.present?
    render json: set_response(200, serialize_resource(earning, EarningSerializer)), status: :ok
  end

  def show
    return render json: set_response(200, serialize_resource(@earning, EarningSerializer)), status: :ok if @earning.present?
    render json: set_response(404, "Not found"), status: :not_found
  end

  def update
    if @earning.present?
      if @earning.update(earning_params)
        render json: set_response(200, serialize_resource(@earning, EarningSerializer)), status: :ok
      else
        render json: set_response(422, @earning.errors.full_messages), status: :unprocessable_entity
      end
    else
      render json: set_response(404, "Earning not found"), status: :not_found
    end
  end

  def destroy
    if @earning.present?
      @earning.destroy
      return render json: set_response(200, "Earning destroied"), status: :ok if @earning.destroyed?
      render json: set_response(422, @earning.errors.full_messages), status: :unprocessable_entity
    else
      render json: set_response(404, "Earning not found"), status: :not_founds
    end
  end

  private
    def earning_params
      params.require(:earning).permit(:description, :value)
    end

    def find_earning
      @earning = current_user.earnings.find_by_id(params[:id])
    end
end
