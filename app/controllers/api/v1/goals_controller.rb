class Api::V1::GoalsController < ApiController
  before_action :find_goal, except: :index
  def index
    goals = current_user.goals
    return render json: set_response(204, "No content"), status: :no_content if !goals.present?
    render json: set_response(200, serialize_resource_list(goals, GoalSerializer)), status: :ok
  end

  def create
    goal = current_user.goals.new(goal_params)
    goal = CalculateEndDateGoalService.new(user: current_user, goal: goal).call
    return render json: set_response(422, goal.errors), status: :unprocessable_entity if goal.errors.present?
    render json: set_response(200, serialize_resource(goal, GoalSerializer)), status: :ok
  end

  def update
    return render json: set_response(404, "Not Found"), status: :not_found unless @goal.present?

    @goal.update(goal_params)
    return render json: set_response(422, @goal.errors.full_messages), status: :unprocessable_entity if @goal.errors.present?

    @goal = CalculateEndDateGoalService.new(user: current_user, goal: @goal).call
    return render json: set_response(422, @goal.errors), status: :unprocessable_entity if @goal.errors.present?
    render json: set_response(200, serialize_resource(@goal, GoalSerializer)), status: :ok
  end

  def destroy
    @goal = current_user.goals.find_by(id: params[:id])
    if @goal.present?
      @goal.destroy
      return render json: set_response(200, "Goal Deleted"), status: :ok if @goal.destroyed?
      render json: set_response(422, @goal.errors), status: :unprocessable_entity
    else
      render json: set_response(404, "Not Found"), status: :not_found
    end
  end

  def show

    if @goal.present?
      render json: set_response(200, serialize_resource(@goal, GoalSerializer)), status: :ok
    else
      render json: set_response(404, "Not Found"), status: :not_found
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:description, :end_date, :parcel, :value)
    end

    def find_goal
      @goal = current_user.goals.find_by(id: params[:id])
    end
end
