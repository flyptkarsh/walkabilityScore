# frozen_string_literal: true

class GeocoderController < ApplicationController

  def walkability_score
    geocode_address
    if @score
      render json: @score, status: 200
    else
      render json: {error: "Address Invalid"}, status: 400
    end
  end

  private

  def geocode_address
    results = Geocoder.search(params['address'])
    if results.first && results.first.coordinates
      @score = WalkabilityScoreGenerator.new(results.first.coordinates).score
    end
  end
end
