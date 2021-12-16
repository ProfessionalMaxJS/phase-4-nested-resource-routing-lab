class ItemsController < ApplicationController

# rescue_from ActiveRecord::RecordNotFound, with: :render_message

  def index
    if params[:user_id]
      items = User.find(params[:user_id]).items
    else 
      items = Item.all
    end
    render json: items, include: :user, status: :ok

    rescue ActiveRecord::RecordNotFound
      render json: {error: "item not found"}, status: :not_found
  end

  def show
    if params[:user_id]
      item = User.find(params[:user_id]).items.find(params[:id])
    else 
      items = Item.find(params[:id])
    end
    render json: item, include: :user, status: :ok

    rescue ActiveRecord::RecordNotFound
      render json: {error: "item not found"}, status: :not_found
  end

  def create
    # user = User.find(params[:user_id])
    new_item = Item.create!(item_params)
    render json: new_item, include: :user, status: :created
  end

end


private

def item_params
  params.permit(:name, :description, :price, :user_id)
end

# def render_message
#   json: {message: "item not found"}, status: :not_found
# end