# frozen_string_literal: true

module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :authenticate_user!

      def show
        render json: { email: current_user.email, id: current_user.id }
      end
    end
  end
end
