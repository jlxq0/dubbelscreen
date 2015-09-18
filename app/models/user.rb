class User < ActiveRecord::Base
  has_many :locations
  has_many :newschannels
  has_many :people
  has_many :plexservers
  devise :database_authenticatable, :rememberable, :trackable, :omniauthable

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
