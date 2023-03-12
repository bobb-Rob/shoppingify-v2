class Api::V1::DefaultCategoriesController < ApiController
  def index
    # render json: return all categories with only name and id fields
    render json: DefaultCategory.all, only: %i[name id]
  end
end
