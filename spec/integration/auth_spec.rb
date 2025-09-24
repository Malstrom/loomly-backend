# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Authentication', type: :request do
  path '/users/sign_in' do
    post 'Sign in a user' do
      tags 'Authentication'
      consumes 'application/json'
      produces 'application/json'

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
        required: [ 'user' ]
      }

      response '200', 'signed in' do
        parameter name: :Authorization,
                  in: :header,
                  type: :string,
                  description: 'JWT token in Authorization header',
                  required: false

        run_test!
      end
    end
  end
end
