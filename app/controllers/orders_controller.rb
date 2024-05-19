class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gear, except: [:edit, :destroy]
  before_action :set_gear_to_del_order, only: [:edit, :destroy]
  before_action :reserved_by_someone?, only: [:index, :create]
  before_action :are_you_owner?, only: [:index, :create]

  # レンタル情報入力画面の表示
  def index
    @order_reservation = OrderReservation.new
  end

  # レンタルの予約作成
  def create
    @order_reservation = OrderReservation.new(order_params_with_date_conversion)
    if @order_reservation.valid?
      @order_reservation.save
      redirect_to root_path, notice: "予約が完了しました"
    else
      render :index, notice: "入力に不備がありました。もう一度入力してください。"
    end
  end

  def edit
  end

  def destroy
    @reservation.destroy
    sleep 3
    @order.destroy
    redirect_to root_path, notice: "返却済みにしました"
  end

  private

  # ギアの取得
  def set_gear
    @gear = Gear.find(params[:gear_id])
  end

  # 自分の商品かどうかの確認
  def are_you_owner?
    if current_user.id == @gear.user_id
      redirect_to root_path, notice: "自分の商品は予約できません"
    end
  end

  # パラメータの取得と日付型への変換
  def reserved_by_someone?
    if @gear.order.present?
      redirect_to root_path, notice: "既に予約されています"
    end
  end

  # パラメータの取得と日付型への変換
  def order_params
    params.require(:order_reservation).permit(:start_date, :end_date, :address, :name, :phone_number, :price)
          .merge(user_id: current_user.id, gear_id: @gear.id)
  end

  # start_dateとend_dateが存在する場合は日付型に変換して返す
  def order_params_with_date_conversion
    params = order_params
    params[:start_date] = Date.parse(params[:start_date]) if params[:start_date].present?
    params[:end_date] = Date.parse(params[:end_date]) if params[:end_date].present?
    params
  end

  # ギアと関連する注文情報を取得
  def set_gear_to_del_order
    @gear = Gear.find(params[:gear_id])
    @order = @gear.order
    @reservation = @order.reservation
  end
end
