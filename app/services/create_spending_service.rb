class CreateSpendingService < BaseService

  def initialize(params)
    super()
    @user = params[:user]
    @spending_params = params[:spending]
    @category_params = params[:category][:categories]
  end

  def call
    create_spending
  end

  private
    def create_spending
      if @user.present?
        categories = []
        spending = nil
        spending = @user.spendings.new(@spending_params)
        spending.save
        if spending.errors.present?
          add_unprocessable_error(spending.errors.full_messages)
          self
        else
          categories << @category_params.map {|category| Category.create(name: category[:name], user: @user)}
          spending.categories << categories.flatten
          spending
        end
      else
        add_unprocessable_error("Spending user can't be null")
      end
    end
end
