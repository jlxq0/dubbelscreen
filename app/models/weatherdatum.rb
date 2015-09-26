class Weatherdatum < ActiveRecord::Base
  belongs_to :location

  after_save :send_notification

  def send_notification
    user = User.where(id: location.user_id).first
    db = Dashboard.where(user_id: user.id).first
    data = db.data user
    Pusher.trigger("private-#{user.name}", 'new_message', data.to_json)
    return true
  end
end
