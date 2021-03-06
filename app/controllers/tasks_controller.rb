class TasksController < ApplicationController
  respond_to :html, :json

  def create
    @task = Task.new(task_params)
    @task.file = params[:task][:file].tempfile if params[:task][:file]
    @task.save
    redirect_to list_path(id: @task.list_id )
    end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      @task.update_attributes(task_params)
        format.html { redirect_to list_path(@task.list) }
        format.json { respond_with_bip(@task) }
    end
  end

  def add_file
    @task = Task.find(params[:id])
  end

  def update_file
    @task = Task.find(params[:id])
    @task.file = params[:task][:file].tempfile if params[:task][:file]
    @task.save
    redirect_to list_path(id: @task.list.id)
  end

  def delete_file
    @task = Task.find(params[:id])
    @task.file = nil
    @task.save
    redirect_to :back
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :back
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :list_id, :file)
  end
end
