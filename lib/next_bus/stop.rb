module NextBus
  class Stop < APIObject
    attr_accessor :stops

    prop :tag
    prop :title
    prop :lat, &:to_f
    prop :lon, &:to_f
    prop :stop_id
  end
end
