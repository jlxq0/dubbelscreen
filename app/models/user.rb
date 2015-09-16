class User < ActiveRecord::Base
  has_many :Weightdatum
  validates :nickname, :fullname, presence: true

  # For rails admin to play nice
  def name
    nickname
  end

  def get_weight
    measurement = withings_connection.measurement_groups.first
    update_weight measurement if measurement
  end

  def get_activity
    yesterday = withings_connection.get_activities(date: Date.yesterday.strftime('%F'))
    update_activity yesterday if yesterday && yesterday["date"]
    today = withings_connection.get_activities(date: Date.today.strftime('%F'))
    update_activity today if today && today["date"]
  end

  protected

  def withings_connection
    Withings.consumer_secret = WITHINGS_OAUTH_CONSUMER_SECRET
    Withings.consumer_key    = WITHINGS_OAUTH_CONSUMER_KEY

    response = Withings::Connection.get_request('/user', withings_key, withings_secret, :action => :getbyuserid, :userid => withings_id)
    user_data = response['users'].detect { |item| item['id'] == withings_id.to_i }
    Withings::User.new(user_data.merge({:oauth_token => withings_key, :oauth_token_secret => withings_secret}))
  end

  def update_weight measurement
    weight = Weightdatum.find_or_initialize_by(user_id: self.id, withings_taken_at: measurement.taken_at)
    weight.update(
      withings_taken_at:                 measurement.taken_at,
      withings_attribution:              measurement.attribution,
      withings_category:                 measurement.category,
      withings_weight:                   measurement.weight,
      withings_size:                     measurement.size,
      withings_fat:                      measurement.fat,
      withings_ratio:                    measurement.ratio,
      withings_fat_free:                 measurement.fat_free,
      withings_diastolic_blood_pressure: measurement.diastolic_blood_pressure,
      withings_systolic_blood_pressure:  measurement.systolic_blood_pressure,
      withings_heart_pulse:              measurement.heart_pulse,
      user_id:                           self.id
    )
  end

  def update_activity day
    activity = Activitydatum.find_or_initialize_by(user_id: self.id, withings_taken_at: day["date"].to_date)
    activity.update(
      withings_taken_at:          day["date"],
      withings_steps:             day["steps"],
      withings_distance:          day["distance"],
      withings_calories:          day["calories"],
      withings_totalcalories:     day["totalcalories"],
      withings_elevation:         day["elevation"],
      withings_soft:              day["soft"],
      withings_moderate:          day["moderate"],
      withings_intense:           day["intense"],
      user_id:                    self.id
    )
  end
end
