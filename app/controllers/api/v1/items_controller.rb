class Api::V1::ItemsController < ApiController
  before_action :set_item, only: %i[show update destroy]
  # GET /items
  def index
    @items = current_user.items
    render json: @items
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created
    else
      render json: { errors: @item.errors.full_messages, status: 422 }, status: :unprocessable_entity
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
    deleted_item = @item.dup
    if @item.destroy
      render json: { message: 'Item deleted' }, status: :ok
    else
      render json: @item.errors, status: :unprocessable_entity
    end
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
