class Api::V1::GoalsController < ApiController
  before_action :find_user

  def index

  end

  def create
    result = CreateGoalService.new(goal_params).call
    # description: goal_params[:description], value: goal_params[:value], end_date: goal_params[:end_date], parcel: goal_params[:parcel]
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
    def goal_params
      params.require(:goal).permit(:description, :end_date, :parcel, :value)
    end
end
