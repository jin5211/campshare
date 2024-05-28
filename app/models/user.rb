class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  validates :name, presence: true
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }, allow_blank: true

  has_many :blogs
  has_many :comments
  has_many :gears
  has_many :orders
  has_one_attached :profile_image
  belongs_to :prefecture
  belongs_to :contact_time

  # Remove the attr_accessor for privacy_policy
  # attr_accessor :privacy_policy

  validates :privacy_policy, acceptance: { accept: true, message: 'を確認し、同意してください' }

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
    # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end
end
