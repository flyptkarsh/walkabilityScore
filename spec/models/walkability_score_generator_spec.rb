# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WalkabilityScoreGenerator, type: :model do
  let(:ws) { described_class.new([40.741235950000004, -73.35669116536101]) }

  describe '#score' do
    it 'returns the score hash' do
      expect(ws.score[:score]).to be >= 0
      expect(ws.score[:score]).to be <= 100
    end
  end

  describe '#nearby_places' do
    it 'returns places within one mile' do
      expect(ws.nearby_places.count).to be >= 0
      expect(ws.nearby_places.count).to be <= 100
    end
  end

  describe '#nearby_food' do
    it 'returns shops within one mile' do
      expect(ws.nearby_food.count).to be >= 0
      expect(ws.nearby_food.count).to be <= 100
    end
  end

  describe '#nearby_shops' do
    it 'returns shops within one mile' do
      expect(ws.nearby_shops.count).to be >= 0
      expect(ws.nearby_shops.count).to be <= 100
    end
  end

  describe '#nearby_transit' do
    it 'returns shops within one mile' do
      expect(ws.nearby_transit.count).to be >= 0
      expect(ws.nearby_transit.count).to be <= 100
    end
  end
end
