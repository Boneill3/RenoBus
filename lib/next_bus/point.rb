module NextBus
  class Point < APIObject
    prop :lat, &:to_f
    prop :lon, &:to_f
  end
end
