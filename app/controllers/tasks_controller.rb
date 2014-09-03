class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:update, :destroy]

  def index
    render json: Task.all.to_json
  end

  def create
    render json: current_user.tasks.create!(task_params)
  end

  def update
    render json: @task.update(task_params)
  end

  def destroy
    render json: @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :due_date)
    end
end
