Barometer::WeatherService.register(:yahoo, Barometer::Yahoo)
Barometer.config = { 1 => [:yahoo], 2 => :wunderground }
