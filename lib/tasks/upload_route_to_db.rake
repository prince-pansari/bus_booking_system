require "json"
namespace :upload_route_to_db do
  desc "Upload route details to db"
  task upload_route_to_db: :environment do
    data = JSON.parse(File.read('lib/tasks/routes.json'))
    data.each do |key, values|
      values.each do |value|
        Station.where({name: value}).first_or_create
      end
      num_stops = values.count
      starting_station = Station.find_by(name: values[0])
      ending_station = Station.find_by(name: values[num_stops - 1])
      route = Route.create({route_name: key,
                            starting_station_id: starting_station[:id],
                            ending_station_id: ending_station[:id]})
      values.each_with_index do |value, stop_number|
        station = Station.find_by(name: value)
        RouteStation.create({route_id: route[:id],
                             station_id: station[:id],
                             station_order: stop_number + 1})
      end
    end
  end
end