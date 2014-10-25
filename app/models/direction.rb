class Direction < ActiveRecord::Base
  belongs_to :route
  has_many :direction_stops, dependent: :destroy
  has_many :stops, through: :direction_stops
end
