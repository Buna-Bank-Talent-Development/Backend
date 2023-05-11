# frozen_string_literal: true

class EmployeeTrainingsController < ApplicationController
  before_action :set_employee_training, only: %i[show update destroy]

  # GET /employee_trainings
  def index
    @q = EmployeeTraining.ransack(params[:q])
    @employee_trainings = @q.result

    render json: @employee_trainings
  end

  # GET /employee_trainings/1
  def show
    render json: @employee_training
  end

  # POST /employee_trainings
  def create
    @employee_training = EmployeeTraining.new(employee_training_params)

    if @employee_training.save
      render json: @employee_training, status: :created, location: @employee_training
    else
      render json: @employee_training.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employee_trainings/1
  def update
    if @employee_training.update(employee_training_params)
      render json: @employee_training
    else
      render json: @employee_training.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employee_trainings/1
  def destroy
    @employee_training.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee_training
    @employee_training = EmployeeTraining.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def employee_training_params
    params.require(:employee_training).permit(:training_id, :employee_id, :season)
  end
end
