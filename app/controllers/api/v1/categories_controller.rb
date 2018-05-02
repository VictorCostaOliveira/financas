class Api::V1::CategoriesController < ApiController

  def index
    render json: set_response(200, serialize_resource_list(current_user.categories, CategorySerializer)), status: :ok
  end

end
