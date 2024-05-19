class Gear < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :name, :info, :price_1, :price_2, :price_3, :image
    validates :brand_id
    validates :category_id
  end

  with_options only_integer: true, greater_than_or_equal_to: 500, less_than_or_equal_to: 100_000 do |model|
    model.validates_numericality_of :price_1
    model.validates_numericality_of :price_2
    model.validates_numericality_of :price_3
  end

  belongs_to :user
  has_one_attached :image
  has_one    :order

  belongs_to :brand
  belongs_to :category
  validates  :brand_id,               numericality: { other_than: 1, message: "can't be blank" }
  validates  :category_id,            numericality: { other_than: 1, message: "can't be blank" }
end
