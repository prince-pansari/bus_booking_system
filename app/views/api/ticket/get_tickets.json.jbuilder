json.tickets @tickets do |ticket|
  json.bus_number ticket.bus.bus_number
  json.route ticket.route.route_name
  json.booking_time ticket.created_at
  json.starting_station ticket.starting_station.name
  json.ending_station ticket.ending_station.name
  json.num_ticket ticket.num_ticket
  json.fare ticket.fare
end
