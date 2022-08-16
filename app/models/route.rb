class Route < ApplicationRecord
  belongs_to :starting_station, class_name: 'Station'
  belongs_to :ending_station, class_name: 'Station'
  has_many :route_stations
end
