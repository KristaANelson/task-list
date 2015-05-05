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
    require 'pry'; binding.pry
    respond_to do |format|
      if @task.update_attributes(complete: params[:task][:complete])
        format.html { redirect_to(lists_path) }
        format.json { respond_with_bip(@task) }
      else
        format.html { redirect_to lists_path }
        format.json { respond_with_bip(@task) }
      end
    end
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :list_id)
  end
end
