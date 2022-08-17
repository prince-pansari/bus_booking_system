class Api::TicketController < ApplicationController

  api :POST, 'api/ticket/book_ticket'
  param :user_id, Integer, required: true
  param :bus_id, Integer, required: true
  param :route_id, Integer, required: true
  param :starting_station_id, Integer, required: true
  param :ending_station_id, Integer, required: true
  param :num_ticket, Integer, required: true
  param :fare, Integer, required: true
  def book_ticket
    if params[:starting_station_id] >= params[:ending_station_id]
      render json: {error: 'Invalid parameters'}, status: :unprocessable_entity
      return
    end
    ticket = Ticket.create({user_id: params[:user_id],
                            bus_id: params[:bus_id],
                            route_id: params[:route_id],
                            starting_station_id: params[:starting_station_id],
                            ending_station_id: params[:ending_station_id],
                            num_ticket: params[:num_ticket],
                            fare: params[:fare]})
    if ticket.id.nil?
      render json: {error: 'Invalid parameters'}, status: :unprocessable_entity
      return
    end
    render json: {msg: 'Ticket booked successfully'}, status: :ok
  end
end

