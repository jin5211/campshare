class Order < ApplicationRecord
  belongs_to :user
  belongs_to :gear
  has_one :reservation
end
