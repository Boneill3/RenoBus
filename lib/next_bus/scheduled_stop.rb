module NextBus
  class ScheduledStop < APIObject
    prop :tag
    prop :epoch_time, &:to_i
  end
end
