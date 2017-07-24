class UsersController < ApplicationController
before_filter :authenticate_user!
before_action :admin_check, only: [:index, :show]

layout "dashboard"

  def index
    @users = User.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: {success: true} }
    end
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html { render :show }
        format.json { render json: {success: true} }
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { render json: {success: true} }
        format.json { render json: {success: true} }
      else
        format.html { render json: {success: false} }
        format.json { render json: {success: false} }
      end
    end
  end
private
  def user_params
    params.permit(:postal_code, :country, :city, :address)
  end
end
