class Location < ActiveRecord::Base
  has_many :daytimes
end
