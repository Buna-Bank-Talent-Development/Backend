# frozen_string_literal: true

class TrainingsController < ApplicationController
  before_action :set_training, only: %i[show update destroy]

  # GET /trainings
  def index
    @q = Training.ransack(params[:q])
    @trainings = @q.result(distinct: true)

    render json: @trainings
  end

  # GET /trainings/1
  def show
    render json: @training
  end

  # POST /trainings
  def create
    @training = Training.new(training_params)

    if @training.save
      render json: @training, status: :created, location: @training
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trainings/1
  def update
    if @training.update(training_params)
      render json: @training
    else
      render json: @training.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trainings/1
  def destroy
    @training.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_training
    @training = Training.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def training_params
    params.require(:training).permit(:training_title, :training_type, :category_id)
  end
end
