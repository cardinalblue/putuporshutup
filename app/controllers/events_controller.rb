class EventsController < ApplicationController
  before_action :build_event, only: ['new', 'edit', 'attendee_respond']

  def new
    itinerary_id = params['itinerary_id']
    render template: 'events/form', locals: { name: itinerary_id }
  end

  def create
    @event = Event.new(event_params)

    @event.save!
    redirect_to itineraries_path, warning: 'New event created!'
  rescue StandardError => e
    render :form, danger: "#{e}"
  end

  def edit
    render template: 'events/form'
  end

  def update
    @event.update!(event_params)
    redirect_to itineraries_path, warning: 'Event updated!'
  rescue StandardError => e
    render :form, danger: "#{e}"
  end

  def show
  end

  def destroy
    @event.destroy
    redirect_to itineraries_path, warning: 'Event deleted.'
  end

  def attendee_respond
    # FIX
    attendee = User.first
    reservation = Reservation.find_by(event_id: @event.id, attendee_id: attendee.id)
    reservation.update!(status: params[:status])
    # TODO: If response is going, should transfer to payment
    redirect_to itinerary_path(@event.itinerary_id), success: 'Response received!'
  end

  private

  def build_event
    @event = Event.find_by(id: params[:id]) || Event.new
  end

  def event_params
    p = params.require(:event).permit(:itinerary_id, :title, :start_time, :end_time, :host, :map_url, :description, :price_per_person, :deadline, :refundable)
    p['host'] = User.find_by!(account: p['host'])
    p
  end
end
