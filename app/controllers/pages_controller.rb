class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trips = Trip.geocoded.all.select{ |trip| trip.joinable? }
    @markers = @trips.map do |trip|
        {
          lat: trip.latitude,
          lng: trip.longitude,
          infoWindow: render_to_string(partial: "shared/info_window_trips", locals: { trip: trip })
        }
      end
    end

  end
