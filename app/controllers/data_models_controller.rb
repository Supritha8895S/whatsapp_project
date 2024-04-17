class DataModelsController < ApplicationController
  protect_from_forgery with: :null_session 

  def create
    @data_model = DataModel.new(data_model_params)
    if @data_model.save
      render json: @data_model, status: :created
    else
      render json: @data_model.errors, status: :unprocessable_entity
    end
  end

  def update
    @data_model = DataModel.find(params[:id])

    if @data_model.update(data_model_params)
      render json: @data_model, status: :ok
    else
      render json: @data_model.errors, status: :unprocessable_entity
    end
  end

  private

  def data_model_params
    params.permit(:name, :data, :full_phone_number)
  end

end
