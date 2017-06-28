class UsersController < ApplicationController
before_filter :authenticate_user!
before_action :admin_check

layout "dashboard"

  def index
    @users = User.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: {success: true} }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
        format.html { render :show }
        format.json { render json: {success: true} }
    end
  end
end
