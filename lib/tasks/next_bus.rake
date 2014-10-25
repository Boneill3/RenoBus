namespace :nextbus do
  desc 'Sync latest data from NextBus api'
  task sync: :environment  do
    NextBus::Service.route_configs.each.with_index do |r, i|

      route = Route.find_or_initialize_by(tag: r.tag)
      route.update!(r.to_hash)

      r.stops.each do |s|
        Stop.find_or_initialize_by(tag: s.tag).update!(s.to_hash)
      end

      r.directions.each do |d|
        dir = route.directions.find_or_initialize_by(tag: d.tag)
        dir.update!(tag: d.tag, title: d.title, name: d.name)
        d.stops.each do |stop|
          DirectionStop.create!(direction: dir, stop: Stop.find_by_tag(stop.tag)) unless dir.stops.any? { |s| s.tag == stop.tag }
        end
      end
    end
  end
end
