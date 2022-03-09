# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::ZipcodesController, type: :request do
  include Rails.application.routes.url_helpers

  describe 'GET /v1/zipcodes/:id' do
    it 'returns correct zipcode' do
      get v1_zipcode_path(1540011), params: { format: :json }

      expect(response).to have_http_status(:ok)
    end
  end
end
