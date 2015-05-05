class ListsController < ApplicationController
  respond_to :html, :json
  
  def index
    @list = List.new
    @lists = List.all
  end

  def show
    @task = Task.new
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    respond_to do |format|
      if @list.update_attributes(title: params[:list][:title])
        format.html { redirect_to(lists_path) }
        format.json { respond_with_bip(@list) }
      else
        format.html { redirect_to lists_path }
        format.json { respond_with_bip(@list) }
      end
    end
  end

  def archive_list
    @list = List.find(params[:id])
    @list.update_attributes({archieved: true})
    redirect_to lists_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def create
    @list = List.new({title: params[:list][:title]})
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end
end
