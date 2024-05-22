class OrderReservation
  include ActiveModel::Model
  attr_accessor :price, :user_id, :gear_id, :name, :address, :phone_number, :token
  attr_reader :start_date, :end_date

  with_options presence: true do
    validates :price
    validates :user_id
    validates :gear_id
    validates :start_date
    validates :end_date
    validates :name
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  validate :validate_start_date_in_future
  validate :validate_end_date_within_range

  # start_dateの設定時に空文字列をnilに変換する
  def start_date=(value)
    @start_date = value.presence
  end

  # end_dateの設定時に空文字列をnilに変換する
  def end_date=(value)
    @end_date = value.presence
  end

  # 予約情報の保存
  def save
    order = Order.create(gear_id: gear_id, user_id: user_id)
    Reservation.create(order_id: order.id,
                       start_date: start_date,
                       end_date: end_date,
                       name: name,
                       address: address,
                       phone_number: phone_number)
  end

  private

  # レンタル開始日が未来の日付であることのバリデーション
  def validate_start_date_in_future
    if start_date.present?
      parsed_start_date = Date.parse(start_date) rescue nil
      if parsed_start_date && parsed_start_date < Date.today + 8.days
        errors.add(:start_date, "レンタルは1週間後以降を選択してください")
        flash[:alert] = "レンタルは1週間後以降を選択してください"
      end
    end
  end

  # 返却日がレンタル開始日以降であることのバリデーション（日帰りプランも考慮）
  def validate_end_date_within_range
    if start_date.present? && end_date.present?
      parsed_start_date = Date.parse(start_date) rescue nil
      parsed_end_date = Date.parse(end_date) rescue nil

      if parsed_start_date && parsed_end_date
        if parsed_end_date < parsed_start_date
          errors.add(:end_date, "返却日はレンタル開始日以降を選択してください")
          flash[:alert] = "返却日はレンタル開始日以降を選択してください"
        end
      end
    end
  end
end
