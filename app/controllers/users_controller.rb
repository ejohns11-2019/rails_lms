class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def new #new user ONLY in memory, renders form
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user #if saves redirect to user
      else
        render :new
      end
  end

  def show #before action finds particualr user
  end

  def destroy
    @user.destroy
    redirect_to users_path #redirect to user index
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end


end
