class Activitydatum < ActiveRecord::Base
  belongs_to :person

  after_save :send_notification

  def send_notification
    person = Person.where(id: person_id).first
    user = User.where(id: person.user_id).first
    activitydatum = Activitydatum.where(person_id: person.id).last
    Pusher.trigger("private-#{user.name}", 'new_message', activitydatum.to_json)
    return true
  end
end
