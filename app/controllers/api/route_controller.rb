class Api::RouteController < ApplicationController


  api :GET, 'api/route/get_all_routes'
  def get_all_routes
    @routes = Route.all.includes(:starting_station, :ending_station)
  end


  api :GET, 'api/route/:id'
  def show
    @route = Route.find_by(id: params[:id])
    if @route.nil?
      render json: {error: 'Route does not exist.'}, status: :not_found
      return
    end
    @starting_station = @route.starting_station
    @ending_station = @route.ending_station

    @route_stations = @route.route_stations.order(station_order: :asc).includes(:station)
  end
end
