class Api::V1::EarningsController < ApiController
  before_action :find_earning, except: :index, :create
  def index
    earnings = current_user.earnings
    render json: set_response(200, serialize_resource_list(earnings, EarningSerializer)), status: :ok if earnings.present?
    render json: set_response(204, "No content"), status: :no_content
  end

  def create
    earning = current_user.earnings.create(earning_params)
    debugger
    return render json: set_response(422, earning.errors.full_messages), status: :unprocessable_entity if earning.errors.present?
    render json: set_response(200, serialize_resource(earning, EarningSerializer)), status: :ok
  end

  def show
    find_earning
    render json: set_response(200, serialize_resource(@earning, EarningSerializer)), status: :ok
  end

  def update
  end

  def destroy
  end

  private
    def earning_params
      params.require(:earning).permit(:description, :value)
    end

    def find_earning
      @earning = current_user.earnings.find_by_id(params[:id])
    end
end
