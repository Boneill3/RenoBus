module NextBus
  class Schedule < APIObject
    def self.create_from_xml(xml)
      parsed_xml = Nokogiri::XML xml
      parsed_xml.css('route').map.with_index do |route|
        RouteSchedule.new(route.attributes).tap do |r|
          r.scheduled_stops = route.css('tr stop').map do |stop| 
            ScheduledStop.new(stop.attributes)
          end
        end
      end
    end

  end
end
