require 'csv'    

CSV.foreach("db/seeds/worldcities.csv", headers: true) do |row|
  City.create!(row.to_hash)
end
