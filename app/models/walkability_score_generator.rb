# frozen_string_literal: true

class WalkabilityScoreGenerator
  attr_accessor :score

  def initialize(coordinates)
    @coordinates = coordinates.join(',')
    @nearby_places = nearby_places
    @nearby_shops = nearby_shops
    @nearby_food = nearby_food
    @nearby_transit = nearby_transit
  end

  def score
    { score: @nearby_places.count,
      shops: @nearby_shops,
      transit: @nearby_transit,
      food: @nearby_food,
      coordinates: @coordinates }
  end

  def nearby_shops
    @nearby_places.select { |p| p['categories'].include? 'shopping-retail' }
  end

  def nearby_food
    @nearby_places.select { |p| p['categories'].include? 'food-beverage' }
  end

  def nearby_transit
    @nearby_places.select { |p| p['categories'].include? 'transportation-terminal' }
  end

  def nearby_places
    categories = 'transportation-terminal,food-beverage,shopping-retail'
    query = "https://api.radar.io/v1/search/places?categories=#{categories}&near=#{@coordinates}&radius=1700&limit=100"
    api_query(query)['places']
  end

  def api_query(query)
    HTTParty.get(query, headers: { 'Authorization' => ENV['RADAR_ENV_KEY'] })
  end
end
