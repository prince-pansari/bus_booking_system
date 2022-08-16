json.routes @routes do |route|
  json.route_id route.id
  json.route_name route.route_name
  json.starting_station_id route.starting_station_id
  json.starting_station_name route.starting_station.name
  json.ending_station_id route.ending_station_id
  json.ending_station_name route.ending_station.name
end