class Route < ActiveRecord::Base
  has_many :directions, dependent: :destroy

  validates :tag, presence: true
  validates :title, presence: true
  validates :color, presence: true
  validates :opposite_color, presence: true
  validates :lat_min, presence: true
  validates :lat_max, presence: true
  validates :lon_min, presence: true
  validates :lon_max, presence: true
end
