class TasksController < ApplicationController
  respond_to :html, :json

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to list_path(id: @task.list_id )
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(task_params)
        format.html { redirect_to(lists_path) }
        format.json { respond_with_bip(@task) }
      else
        format.html { redirect_to lists_path }
        format.json { respond_with_bip(@task) }
      end
    end
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
