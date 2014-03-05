# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Category.destroy_all
Photo.destroy_all

DatabaseCleaner.clean_with(:truncation, :only => %w[categories])
DatabaseCleaner.clean_with(:truncation, :only => %w[photos])

CSV.foreach("#{Rails.root}/lib/assets/categories.csv", headers: true) do |row|
     Category.create(
        :title => row[0],
        :main_category => row[1]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/image.csv", headers: true) do |row|
     Photo.create(
        :id_num => row[0],
        :title => row[1],
        :main_category => row[2],
        :sub_category => row[3] ,
        :category_id => row[4],
        :desc => row[5]
      )

end
