# spec/requests/profile_spec.rb
require 'swagger_helper'

RSpec.describe 'Profile', type: :request do
  path '/api/v1/profile' do
    get 'Show current user profile' do
      tags 'Profile'
      produces 'application/json'
      security [ bearerAuth: [] ]

      response '200', 'Profile data' do
        let(:Authorization) { "Bearer dummy_token" }
        run_test!
      end

      response '401', 'Unauthorized' do
        run_test!
      end
    end
  end
end
