class Point < ActiveRecord::Base
  belongs_to :path
  default_scope -> { where('points.id % 5 = 0') }
end
