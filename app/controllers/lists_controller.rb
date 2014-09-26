class ListsController < ApplicationController
  def index
    @lists = current_user.lists if current_user.present?
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def edit
    @list = List.find(params[:id])
    authorize @list
  end

  def create
    @list = current_user.lists.new(list_params)

    authorize @list
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

    authorize @list
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

    authorize @list
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
