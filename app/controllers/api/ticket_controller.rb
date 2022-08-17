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

  api :GET, 'api/ticket/get_tickets'
  param :size, String, required: false
  param :user_id, String, required: true
  def get_tickets
    user = User.find_by(id: params[:user_id])
    if user.nil?
      render json: {error: 'User does not exist'}, status: :unprocessable_entity
      return
    end

    if params[:size].nil?
      @tickets = Ticket.where(user_id: params[:user_id]).order(created_at: :desc)
                      .includes(:bus, :route, :starting_station, :ending_station)
    elsif params[:size] == 0
      @tickets = []
    else
      @tickets = Ticket.where(user_id: params[:user_id]).order(created_at: :desc)
                      .includes(:bus, :route, :starting_station, :ending_station).take(params[:size])
    end
  end
end

