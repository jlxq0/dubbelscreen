class User < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :newschannels, dependent: :destroy
  has_many :people, dependent: :destroy
  has_many :plexservers, dependent: :destroy
  has_many :dashboards, dependent: :destroy
  devise :database_authenticatable, :rememberable, :trackable, :omniauthable

  def to_param
    name
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.nickname
      user.password = Devise.friendly_token[0,20]
    end
  end
end
