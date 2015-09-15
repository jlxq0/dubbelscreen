class User < ActiveRecord::Base
  has_many :Weightdatum
  validates :nickname, :fullname, presence: true

  # For rails admin to play nice
  def name
    nickname
  end

end
