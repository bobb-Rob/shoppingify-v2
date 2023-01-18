class Api::V1::ListsController < ApiController
  before_action :set_list, only: %i[update]

  # GET /lists
  def index
    @lists = current_user.lists

    render json: @lists
  end

  # Get single active list - /list/active
  def active
    # Find the list with status: active - Since only one list can have the value active.
    @list = current_user.lists.find { |list| list.status === 'active' } # rubocop:disable Style/CaseEquality
    if @list
      render json: @list
    else
      render json: { errors: @list.errors.full_messages, status: 'There is no active list', list: {} }
    end
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
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
    params.require(:list).permit(:name, :status, :user_id, :completed)
  end
end
