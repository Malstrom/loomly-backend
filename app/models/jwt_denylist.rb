# frozen_string_literal: true

class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
end

# == Schema Information
# Table name: jwt_denylists
#  jti: string
#  exp: datetime
#  created_at: datetime
#  updated_at: datetime
