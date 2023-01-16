class Api::V1::RecordsController < ApplicationController
  before_action :set_record, only: %i[update destroy]

  # GET /records
  def index
    # get records for current user

    @records = Record.all

    render json: @records
  end

  # GET /records/1

  # POST /records
  def create
    @record = Record.new(record_params)

    if @record.save
      render json: @record, status: :created
    else
      render json: { errors: @record.errors, status: 422 }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /records/1
  def update
    if @record.update(record_params)
      render json: @record
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  # DELETE /records/1
  def destroy
    deleted_record = @record.deep_dup
    category_name = @record.item.category.name
    if @record.destroy
      render json: { message: 'record deleted', item_category_name: category_name, deleted_record: }, status: :ok
    else
      render json: @record.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:item_id, :list_id, :quantity)
  end
end
