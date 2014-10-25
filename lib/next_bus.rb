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
        NextBus::RouteConfigs.parse connection.get('', command: 'routeConfig', a: agency, terse: true).body
      end
    end
  end
end
