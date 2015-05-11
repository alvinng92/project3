class WindDirection < ActiveRecord::Base
  belongs_to :observation
  before_save :format_direction

  private

  def format_direction
    return if(self.value.nil?)
    d = self.value
    case d
    when "N"
      self.value = "0"
    when "NNE"
      self.value = "22.5"
    when "NE"
      self.value = "45"
    when "ENE"
      self.value = "77.5"
    when "E"
      self.value = "90"
    when "ESE"
      self.value = "112.5"
    when "SE"
      self.value = "135"
    when "SSE"
      self.value = "157.5"
    when "S"
      self.value = "180"
    when "SSW"
      self.value = "202.5"
    when "SW"
      self.value = "225"
    when "WSW"
      self.value = "247.5"
    when "W"
      self.value = "270"
    when "WNW"
      self.value = "292.5"
    when "NW"
      self.value = "315"
    when "NNW"
      self.value = "337.5"
    when "CALM"
      self.value = "none"
    end
  end
end
