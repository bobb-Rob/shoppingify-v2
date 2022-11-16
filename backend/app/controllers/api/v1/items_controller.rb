class Api::V1::ItemsController < ApiController
  before_action :set_item, only: %i[show update destroy]

  # GET /items
  def index
    @items = current_user.items
    array_of_categories = current_user.categories.map(&:attributes)
    current_user.categories.each_with_index do |category, index|
      array_of_items = @items.map(&:attributes)
    end

    render json: array_of_categories
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :note, :image, :category_id, :user_id)
  end
end
