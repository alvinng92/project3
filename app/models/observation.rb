class Observation < ActiveRecord::Base
  belongs_to :daytime
  has_one :dewpoint
  has_one :rainfall
  has_one :temperature
  has_one :wind_direction
  has_one :wind_speed
end
