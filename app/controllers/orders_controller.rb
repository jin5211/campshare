class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gear, except: [:edit, :destroy]
  before_action :set_gear_to_del_order, only: [:edit, :destroy]
  before_action :reserved_by_someone?, only: [:index, :create]
  before_action :are_you_owner?, only: [:index, :create]
  before_action :ensure_profile_complete, only: [:index, :create]

  # レンタル情報入力画面の表示
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_reservation = OrderReservation.new
  end

  # レンタルの予約作成
  def create
    @order_reservation = OrderReservation.new(order_params_with_date_conversion)
    if @order_reservation.valid?
      pay_item
      @order_reservation.save
      redirect_to root_path, notice: "予約が完了しました"
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
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
          .merge(user_id: current_user.id, gear_id: @gear.id, token: params[:token])
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

  # Ensure user profile is complete before proceeding
  def ensure_profile_complete
    unless current_user.profile_image.attached? &&
           current_user.prefecture_id.present? &&
           current_user.address.present? &&
           current_user.phone_number.present? &&
           (current_user.contact_time_id.present? || current_user.contact_time_another.present?)
      redirect_to edit_user_path(current_user), alert: 'プロフィール情報が不足しています。レンタルを行う前にプロフィールを完成させてください。'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
