class ItinerariesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    render template: 'itineraries/form'
  end

  before_action :authenticate_user!
  def create
    @itinerary = current_user.itineraries.create(:title => 'My New Itinerary!')
    @itinerary.save!
    redirect_to itineraries_path, warning: 'New itinerary created!'
  rescue StandardError => e
    render :form, danger: "#{e}"
  end

  def edit
  end

  def update
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @events = @itinerary.events
  end

  def destroy
  end
end
