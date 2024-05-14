class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true
end
