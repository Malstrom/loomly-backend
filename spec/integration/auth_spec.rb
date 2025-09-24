# spec/integration/auth_spec.rb
require 'swagger_helper'

RSpec.describe 'Authentication', type: :request do
  path '/users/sign_in' do
    post 'User login' do
      tags 'Auth'
      consumes 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: ['user']
      }

      response '200', 'login success' do
        let(:user) { create(:user, email: 'test@test.com', password: 'password') }
        let(:credentials) { { user: { email: user.email, password: 'password' } } }
        run_test!
      end
    end
  end
end
