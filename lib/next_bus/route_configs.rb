module NextBus
  class RouteConfigs
    def self.parse(xml)
      parsed_xml = Nokogiri::XML xml
      parsed_xml.css('route').map.with_index do |route, i|
        Route.new(route.attributes).tap do |r|
          r.stops = (route > 'stop').map do |stop|
            Stop.new(stop.attributes)
          end

          r.directions = route.css('direction').map do |d|
            Direction.new(d.attributes).tap do |dir|
              dir.stops = d.css('stop').map do |s|
                Stop.new(s.attributes)
              end
            end

          end
        end
      end
    end
  end
end

