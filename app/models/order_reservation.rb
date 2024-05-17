class OrderReservation
  include ActiveModel::Model
  attr_accessor :price, :user_id, :gear_id, :start_date, :end_date, :address, :phone_number

  with_options presence: true do
    validates :price
    validates :user_id
    validates :gear_id
    validates :start_date
    validates :end_date
    validates :address
    validates :phone_number,
              format: { with: /\A\d{10,11}\z/ }
  end

  def start_date
    @start_date ||= Date.today + 7.days
  end

  def end_date
    @end_date ||= start_date + 2.days
  end
end