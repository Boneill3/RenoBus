module NextBus
  class Route < APIObject
    attr_accessor :stops, :directions

    prop :tag
    prop :title
    prop :color
    prop :opposite_color
    prop :lat_min, &:to_f
    prop :lat_max, &:to_f
    prop :lon_min, &:to_f
    prop :lon_max, &:to_f
  end
end
