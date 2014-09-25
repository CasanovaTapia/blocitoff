class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "List was not saved. Please try again."
      render :new
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "List was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      flash[:notice] = "List was deleted."
      redirect_to lists_path
    else
      flash[:error] = "List was not deleted. Please try again."
      render :show
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end

end
