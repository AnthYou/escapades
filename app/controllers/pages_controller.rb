class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trips = Trip.geocoded
    @markers = @trips.map do |trip|
      {
        lat: trip.latitude,
        lng: trip.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { trip: trip })
      }
    end
  end
end
