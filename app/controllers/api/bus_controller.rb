class Api::BusController < ApplicationController

  api :GET, 'api/bus/get_bus_detail'
  param :bus_number, String, required: true
  def get_bus_detail
    @bus = Bus.find_by(bus_number: params[:bus_number])
    if @bus.nil?
      render json: {error: 'Bus number does not exist.'}, status: :not_found
      return
    end
    @route = @bus.route
    @starting_station =  @route.starting_station
    @ending_station = @route.ending_station
    @route_stations = @route.route_stations.order(station_order: :asc).includes(:station)
  end
end