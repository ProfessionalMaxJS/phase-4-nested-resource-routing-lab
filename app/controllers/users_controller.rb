class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  def index
      users = User.all
    render json: users, status: :ok
  end



end
