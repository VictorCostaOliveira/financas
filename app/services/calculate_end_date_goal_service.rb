class CalculateEndDateGoalService < BaseService
  def initialize(params)
    super()
    @user = params[:user]
    @goal = params[:goal]
  end

  def call
    goal_end_date
  end

  private

    def goal_end_date
      value = @goal.value
      parcel = @goal.parcel
      if values_not_allowed(value, parcel)
        add_unprocessable_error("Values not allowed")
        return self
      end
      total_months = (value / parcel).to_i
      @goal.end_date = Time.current + total_months.months
      @goal.save
      @goal
    end

    def values_not_allowed(value, parcel)
      value < 0 || parcel < 0
    end

end
