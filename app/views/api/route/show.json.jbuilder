json.route_id @route.id
json.route_name @route.route_name
json.starting_station_id @route.starting_station_id
json.starting_station_name @starting_station.name
json.ending_station_id @route.ending_station_id
json.ending_station_name @ending_station.name
json.stops @route_stations do |route_station|
  json.station_id route_station.id
  json.station_name route_station.station.name
  json.stop_number route_station.station_order
end