module NextBus
  class RouteConfig
    class << self
      def create_from_xml(xml)
        parsed_xml = Nokogiri::XML xml
        parsed_xml.css('route').map.with_index do |route, i|
          NextBus::Route.new(route.attributes).tap do |r|
            r.stops = get_stops route
            r.directions = get_directions route
            r.paths = get_paths route
          end
        end
      end

      private 

      def get_stops(route_xml) 
        (route_xml > 'stop').map do |stop|
          NextBus::Stop.new(stop.attributes)
        end
      end

      def get_directions(route_xml)
        route_xml.css('direction').map do |d|
          NextBus::Direction.new(d.attributes).tap do |dir|
            dir.stops = d.css('stop').map do |s|
              NextBus::Stop.new(s.attributes)
            end
          end
        end
      end

      def get_paths(route_xml)
        route_xml.css('path').map do |path|
          p = NextBus::Path.new
          p.points = path.css('point').map do |point|
            NextBus::Point.new(point.attributes)
          end
          p
        end
      end

    end
  end
end

