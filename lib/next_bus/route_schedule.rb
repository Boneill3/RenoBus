module NextBus
  class RouteSchedule < APIObject
    attr_accessor :scheduled_stops

    prop :tag
    prop :title
    prop :schedule_class
    prop :service_class
    prop :direction
  end
end
