module NextBus
  class Service
    @url = 'http://webservices.nextbus.com/service/publicXMLFeed'
    @agency = 'reno'

    class << self
      attr_accessor :url, :agency, :connection

      def connection
        @connection ||= Faraday.new url: url
      end

      def url=(u)
        @connection = nil
        @url = u
      end

      def route_configs
        NextBus::RouteConfigs.parse connection.get('', command: 'routeConfig', a: agency).body
      end

      def schedule(routeTag)
        NextBus::Schedule.create_from_xml connection.get('', command: 'schedule', a: agency, r: routeTag).body
      end
    end
  end
end
