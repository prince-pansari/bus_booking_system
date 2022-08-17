class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  belongs_to :route
  belongs_to :starting_station, class_name: 'Station'
  belongs_to :ending_station, class_name: 'Station'
end
