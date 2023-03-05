class Api::V1::ListsController < ApiController
  before_action :set_list, only: %i[update]

  # GET /lists
  def index
    @lists = current_user.lists.where.not(status: "active")
    if @lists
      render json: @lists
    else
      render json: { errors: @lists.errors }
    end
  end

  # Get single active list - /list/active
  def active   
    @list = List.where(status: 'active', user_id: current_user)[0]
    if @list
      render json: @list
    else
      # redirect_to action: :create
      @list = List.new(name: 'shopping List', status: 'active', user_id: current_user.id)
      if @list.save
        render json: @list, status: :created
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name, :status, :user_id)
  end
end
