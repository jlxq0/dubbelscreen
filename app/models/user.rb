class User < ActiveRecord::Base
  has_many :Weightdatum
  validates :nickname, :fullname, presence: true

  # For rails admin to play nice
  def name
    nickname
  end

  def get_weight
    measurement = withings_connection.measurement_groups.first
    last_taken_at = Weightdatum.where(user_id = self.id).order("created_at").last.withings_taken_at

    unless measurement.taken_at == last_taken_at
      Weightdatum.create(
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
  end

  protected

  def withings_connection
    Withings.consumer_secret = WITHINGS_OAUTH_CONSUMER_SECRET
    Withings.consumer_key    = WITHINGS_OAUTH_CONSUMER_KEY

    response = Withings::Connection.get_request('/user', withings_key, withings_secret, :action => :getbyuserid, :userid => withings_id)
    user_data = response['users'].detect { |item| item['id'] == withings_id.to_i }
    Withings::User.new(user_data.merge({:oauth_token => withings_key, :oauth_token_secret => withings_secret}))
  end
end
