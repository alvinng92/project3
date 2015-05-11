class Daytime < ActiveRecord::Base
  belongs_to :location
  has_many   :observations
end
