class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
    @gears = @user.gears.all
    @blogs = @user.blogs.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :profile_image, :name, :profile, :prefecture_id, :address, :phone_number, :contact_time_id, :contact_time_another )
  end

  def correct_user
    redirect_to(root_url) unless @user == current_user
  end
end
