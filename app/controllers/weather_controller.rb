class WeatherController < ApplicationController
  def index
  end
  def data
    def get_data(loc, src)
      dt = Daytime.where(:location_id =>(loc.id)).last
      o = Observation.find_by daytime_id:(dt.id), source:src
      return [(Temperature.find_by observation_id:(o.id)).value,(Dewpoint.find_by observation_id:(o.id)).value,(Rainfall.find_by observation_id:(o.id)).value,(WindDirection.find_by observation_id:(o.id)).value,(WindSpeed.find_by observation_id:(o.id)).value]
    end
    @most_recent = Daytime.last.time
    @weather_bom = []
    @weather_fcio = []
    @locations = Location.all
    @locations.each do |loc| 
      tmp = [loc.name,get_data(loc,"bom")]
      @weather_bom << tmp
    end
    @locations.each do |loc|
      tmp = [loc.name, get_data(loc,"forecast_io")]
      @weather_fcio << tmp
    end
  end
  def forecast
  end
end
