class Location < ActiveRecord::Base
  has_many :weatherdata

  def get_weather
    coordinates = "#{lat.to_f},#{long.to_f}"
    barometer = Barometer.new(coordinates)
    weather = barometer.measure

    weatherdatum = Weatherdatum.find_or_initialize_by(location_id: self.id, date: weather.today.date.to_date)
    weatherdatum.update(
      date:         weather.today.date,
      high:         weather.today.high,
      low:          weather.today.low,
      sunrise:      weather.today.sun.rise,
      sunset:       weather.today.sun.set,
      icon:         weather.today.icon,
      condition:    weather.today.condition,
      location_id:  self.id
    )
  end
end
