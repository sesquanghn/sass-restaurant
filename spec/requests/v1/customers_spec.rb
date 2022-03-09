# frozen_string_literal: true

require 'rails_helper'

RSpec.describe V1::CustomersController, type: :request do
  include Rails.application.routes.url_helpers

  let(:user) { create(:user) }
  let!(:customer) { create(:customer) }
  let(:customer_params) { { customer: attributes_for(:customer) } }

  before(:each) do
    @auth_token = user.create_new_auth_token
    @auth_token.merge!("X-Restaurant-Tenant-Id" => "test_app", "HTTP_ACCEPT" => "application/json")
  end

  describe "GET /v1/customers" do
    it 'returns list customers' do
      get v1_customers_path, headers: @auth_token

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["customers"].size).to eq(1)
    end

    let(:search_params) do
      {
        phone: customer_params[:phone],
        name: customer_params[:name]
      }
    end

    it 'returns customer by search params' do
      get v1_customers_path, headers: @auth_token, params: search_params

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["customers"].size).to eq(1)
    end
  end

  describe 'GET /v1/customers/:id' do
    it 'returns correct customer' do
      get v1_customer_path(customer.id), headers: @auth_token

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["id"]).to eq(customer.id)
    end
  end

  describe 'POST /v1/customers' do
    it 'creates customer succesfully' do
      expect do
        post v1_customers_path, params: customer_params, headers: @auth_token
      end.to change(Customer, :count).by(1)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /v1/customers/:id' do
    let(:customer_update_params) { customer_params.deep_merge(customer: { name: 'updated_name' }) }

    it 'updates customer successfully' do
      put v1_customer_path(customer.id), params: customer_update_params, headers: @auth_token

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body["data"]["attributes"]["name"]).to eq(customer_update_params[:customer][:name])
    end
  end

  describe 'DELETE /v1/customer/:id' do
    it 'deletes customer successfully' do
      expect {
        delete v1_customer_path(customer.id), headers: @auth_token
      }.to change(Customer.kept, :count).by(-1)

      expect(response).to have_http_status(:ok)
    end
  end
end
