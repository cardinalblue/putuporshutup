class ItinerariesController < ApplicationController
  def index
  end

  def new
    render template: 'itinerary/form'
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)

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
  end

  def destroy
  end
end
