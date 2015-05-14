class Prediction < ActiveRecord::Base
	belongs_to :location
	has_one :temp_pred
	has_one :rain_pred
	has_one :wind_speed_pred
	has_one :wind_dir_pred
end
