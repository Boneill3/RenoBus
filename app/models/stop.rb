class Stop < ActiveRecord::Base
  has_many :direction_stops, dependent: :destroy
  has_many :directions, through: :direction_stops
end
