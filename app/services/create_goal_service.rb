class CreateGoalService
  def initialize(params)
    @description = params[:description]
    @value = params[:value]
    @parcel = params[:parcel]
    @end_date = params[:end_date]
  end

  def call
    create_goal
  end

  private
    def create_goal
      goal = Goal.create(description: @description, value: @value, parcel: @parcel, end_date: @end_date)

    end
end
