#require 'csv'

#CSV.foreach("db/seeds/worldcities.csv", headers: true) do |row|
#  City.create!(row.to_hash)
#end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
