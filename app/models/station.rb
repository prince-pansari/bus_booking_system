class Station < ApplicationRecord
  has_many :starting_station_routes, class_name: 'Route', foreign_key: 'starting_station_id'
  has_many :ending_station_routes, class_name: 'Route', foreign_key: 'ending_station_id'
  has_many :route_stations
  has_many :starting_station_ticket, class_name: 'Ticket', foreign_key: 'starting_station_id'
  has_many :ending_station_ticket, class_name: 'Ticket', foreign_key: 'ending_station_id'
end
