class Location < ActiveRecord::Base
  has_many :Weatherdatum

  def pulldata
    coordinates = "#{lat.to_f},#{long.to_f}"
    barometer = Barometer.new(coordinates)
    weather = barometer.measure

    Weatherdatum.create(
      temperature:  weather.current.temperature,
      time:         DateTime.now,
      location_id:  self.id
    )
  end
end
