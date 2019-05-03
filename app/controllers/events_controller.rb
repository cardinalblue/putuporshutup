class EventsController < ApplicationController
  before_action :build_event, only: ['new', 'edit']

  def new
    render template: 'events/form'
  end

  def create
    @event = Event.new(event_params)
    # FIX
    @event.itinerary_id = 1

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

  private

  def build_event
    @event = Event.find_by(id: params[:id]) || Event.new
  end

  def event_params
    p = params.require(:event).permit(:title, :start_time, :end_time, :host, :map_url, :description, :price_per_person, :deadline, :refundable)
    p['host'] = User.find_by!(account: p['host'])
    p
  end
end
