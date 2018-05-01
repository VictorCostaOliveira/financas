class Api::V1::GoalsController < ApiController
  before_action :find_user

  def index
    goals = @user.goals
    render json: goals, status: :ok
  end

  def create
    goal = @user.goals.new(goal_params)
    goal = CalculateEndDateGoalService.new(user: @user, goal: goal).call
    if goal.errors.present?
      render json: set_response(422, goal.errors), status: :unprocessable_entity
    else
      render json: set_response(200, goal), status: :ok
    end
  end

  def update
    goal = @user.goals.find_by(id: params[:id])
    return render json: set_response(404, "Not Found"), status: :not_found unless goal.present?
    goal.update(goal_params)
    if goal.errors.present?
      render json: set_response(422, goals.errors.full_messages), status: :unprocessable_entity
    else
      goal = CalculateEndDateGoalService.new(user: @user, goal: goal).call
    end
    if goal.errors.present?
      render json: goal.errors, status: :unprocessable_entity
    else
      render json: goal, status: :ok
    end
  end

  def destroy
    goal = @user.goals.find_by(id: params[:id])
    if goal.present?
      goal.destroy
      if goal.destroyed?
        render json: set_response(200, "Ok"), status: :ok
      else
        render json: set_response(422, goals.errors), status: :unprocessable_entity
      end
    else
      render json: set_response(404, "Not Found"), status: :not_found
    end
  end

  def show
    goal = @user.goals.find_by(id: params[:id])
    if goal.present?
      render json: set_response(200, goal), status: :ok
    else
      render json: set_response(404, "Not Found"), status: :not_found
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:description, :end_date, :parcel, :value)
    end
end
