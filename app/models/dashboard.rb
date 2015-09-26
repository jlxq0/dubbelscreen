class Dashboard < ActiveRecord::Base
  belongs_to :user

  def data current_user
    #user = User.where(name: "jlxq0").select([:id, :email, :name]).first
    user = current_user
    data = Hash.new
    data[:people] = Hash.new
    Person.where(user_id: user.id).each do |person|
      data[:people][person.name] = Hash.new
      data[:people][person.name][:activitydata] = person
        .activitydata
        .select(:id, :withings_calories, :withings_distance, :withings_steps, :withings_totalcalories, :withings_taken_at)
        .order('withings_taken_at DESC')
        .limit(7)
      data[:people][person.name][:healthdata] = person
        .weightdata
        .where("withings_weight IS NOT NULL")
        .select(:id, :withings_fat, :withings_heart_pulse, :withings_weight, :withings_taken_at)
        .order('withings_taken_at DESC')
        .limit(7)
    end

    data[:newschannels] = Hash.new
    Newschannel.where(user_id: user.id).each do |newschannel|
      data[:newschannels][newschannel.name] = newschannel
        .news
        .select(:id, :title, :updated_at)
        .order('updated_at DESC')
        .limit(5)
    end

    data[:locations] = Hash.new
    Location.where(user_id: user.id).each do |location|
      data[:locations][location.name] = location
        .weatherdata
        .select(:condition, :date, :high, :icon, :id, :low, :sunrise, :sunset)
        .order('updated_at DESC')
        .limit(5)
    end

    data[:plexservers] = Hash.new
    Plexserver.where(user_id: user.id).each do |plexserver|
      data[:plexservers][plexserver.name] = plexserver
        .plexmedia
        .select(:id, :mediatype, :title, :updated_at)
        .order('updated_at DESC')
        .limit(5)
    end
    data
  end
end
