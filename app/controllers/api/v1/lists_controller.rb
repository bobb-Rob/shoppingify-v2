class Api::V1::ListsController < ApiController
  before_action :set_list, only: %i[update]

  # GET /lists
  def index
    # if current_user is available, get all lists for current user, else get all lists
    if current_user?
      @lists = current_user.lists.includes(:status).where.not(status: 'active')
      # Use tenary operator to check if @lists is true or false, return @lists if true, else return { error: @lists.errors }
      if @lists
        render json: @lists
      else
        render json: { error: @lists.errors }
      end
    else
      @lists = List.all
      if @lists
        render json: @lists
      else
        render json: { error: @lists.errors }
      end
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
