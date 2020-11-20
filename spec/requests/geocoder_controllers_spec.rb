# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GeocoderControllers', type: :request do
  describe 'POST /walkability_score' do
    it 'provides a walkability_score for a valid address' do
      post walkability_score_path, params: { address: '432 park, ny, ny' }
      expect(response).to have_http_status(200)
    end

    it 'provides a walkability_score for a valid address' do
      post walkability_score_path, params: { address: '432 park, ny, ny' }
      expect(response).to have_http_status(200)
    end

    it 'returns a status of 400 for a non geotaggable address input' do
      post walkability_score_path, params: { address: '857298345790' }
      expect(response).to have_http_status(400)
    end
  end
end
