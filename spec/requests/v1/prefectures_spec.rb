# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::PrefecturesController, type: :request do
  include Rails.application.routes.url_helpers

  describe 'GET /v1/prefectures' do
    it 'returns prefectures' do
      get v1_prefectures_path, params: { format: :json }

      expect(response).to have_http_status(:ok)
    end
  end
end
