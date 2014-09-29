class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    @item.user_id = current_user.id

    authorize @item
    if @item.save
      flash[:notice] = "List item was saved."
      redirect_to @list 
    else
      flash[:error] = "List item was not saved. Please try again."
      redirect_to @list 
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])

    authorize @item
    if @item.destroy
      flash[:notice] = "Successfully completed!"
      redirect_to @list
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to @list
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:body)
  end

end
