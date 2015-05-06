class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :delete]
  respond_to :html, :json

  def index
    @list = List.new
    @lists = List.includes(:tasks).all
  end

  def show
    @task = Task.new
    @shown_tasks = params[:complete] ? @list.tasks.send(params[:complete]) : @list.tasks
    @shown = params[:complete] ? params[:complete] : "all"
  end

  def update
    respond_to do |format|
      if @list.update_attributes(list_params)
        format.html { redirect_to(lists_path) }
        format.json { respond_with_bip(@list) }
      else
        format.html { redirect_to lists_path }
        format.json { respond_with_bip(@list) }
      end
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to :back
  end

  def create
    @list = List.new({title: params[:list][:title]})
    @list.save
    redirect_to lists_path
  end

  def archived_lists
    @lists = List.archived
  end

  private

  def list_params
    params.require(:list).permit(:title, :archived)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
