class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist
  self.table_name = 'jwt_denylist'
end

# == Schema Information
# Table name: jwt_denylists
#  jti: string
#  exp: datetime
#  created_at: datetime
#  updated_at: datetime
