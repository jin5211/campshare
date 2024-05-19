class GearsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_gear, except: [:index, :new, :create]
  before_action :user_confirmation, only: [:edit, :update, :destory]
  before_action :reserved_by_someone?, only: [:edit, :update, :destroy]

  def index
    @gears = Gear.order('created_at DESC')
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new(gear_params)
    if @gear.save
      redirect_to gears_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @gear.update(gear_params)
      redirect_to gear_path(@gear)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @gear.destroy
    redirect_to root_path
  end

  private

  def gear_params
    params.require(:gear).permit(:name,
                                 :info,
                                 :brand_id,
                                 :category_id,
                                 :price_1,
                                 :price_2,
                                 :price_3,
                                 :image).merge(user_id: current_user.id)
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def user_confirmation
    redirect_to root_path unless current_user == @gear.user
  end

  def reserved_by_someone?
    if @gear.order.present?
      redirect_to root_path
    end
  end
end
