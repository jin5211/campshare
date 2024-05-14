class Gear < ApplicationRecord
  with_options presence: true do
    validates :name, :info, :price, :image
    validates :brand_id
    validates :category_id
  end

  validates_numericality_of :price, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999

  belongs_to :user
  has_one_attached :image
  has_one    :order

  belongs_to :brand
  belongs_to :category
  validates  :brand_id,               numericality: { other_than: 1, message: "can't be blank" }
  validates  :category_id,            numericality: { other_than: 1, message: "can't be blank" }
end
