class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end

# == Schema Information
# Table name: users
#  email: string
#  encrypted_password: string
#  reset_password_token: string
#  reset_password_sent_at: datetime
#  remember_created_at: datetime
#  created_at: datetime
#  updated_at: datetime
