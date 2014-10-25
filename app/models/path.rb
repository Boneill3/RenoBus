class Path < ActiveRecord::Base
  belongs_to :route
  has_many :points, dependent: :destroy
end
