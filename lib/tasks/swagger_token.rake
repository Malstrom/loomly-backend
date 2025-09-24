# frozen_string_literal: true

# lib/tasks/swagger_token.rake
namespace :swagger do
  desc 'Generate a JWT token for Swagger UI and update rswag_ui.rb'
  task refresh_token: :environment do
    # Trova o crea un utente di test (puoi usare sempre lo stesso)
    user = User.find_or_create_by!(email: 'swagger@example.com') do |u|
      u.password = 'password123'
      u.password_confirmation = 'password123'
    end

    # Genera il token usando warden-jwt_auth
    payload = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil)
    token = payload[0]

    puts "Generated JWT token for Swagger: #{token}"

    # Percorso al file rswag_ui.rb
    file_path = Rails.root.join('config', 'initializers', 'rswag_ui.rb')

    # Sostituisce il token esistente con il nuovo
    text = File.read(file_path)
    new_text = text.gsub(/Bearer\s+[A-Za-z0-9\-\._~\+\/]+=*/, "Bearer #{token}")

    File.open(file_path, 'w') { |f| f.puts new_text }

    puts '✅ Updated rswag_ui.rb with new token'
  end
end
