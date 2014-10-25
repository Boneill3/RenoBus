class DirectionStop < ActiveRecord::Base
  belongs_to :direction
  belongs_to :stop
end
