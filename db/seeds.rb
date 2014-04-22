# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Photo.destroy_all
Category.destroy_all
MainCategory.destroy_all
CategoryPhoto.destroy_all

Size.destroy_all
Format.destroy_all
Mat.destroy_all
Frame.destroy_all
CategoryMat.destroy_all

TieredShipping.destroy_all
Feedback.destroy_all

DatabaseCleaner.clean_with(:truncation, :only => %w[photos])
DatabaseCleaner.clean_with(:truncation, :only => %w[categories])
DatabaseCleaner.clean_with(:truncation, :only => %w[main_categories])
DatabaseCleaner.clean_with(:truncation, :only => %w[category_photos])

DatabaseCleaner.clean_with(:truncation, :only => %w[sizes])
DatabaseCleaner.clean_with(:truncation, :only => %w[formats])
DatabaseCleaner.clean_with(:truncation, :only => %w[mats])
DatabaseCleaner.clean_with(:truncation, :only => %w[frames])
DatabaseCleaner.clean_with(:truncation, :only => %w[category_mats])

DatabaseCleaner.clean_with(:truncation, :only => %w[tiered_shippings])
DatabaseCleaner.clean_with(:truncation, :only => %w[feedbacks])
DatabaseCleaner.clean_with(:truncation, :only => %w[friendly_id_slugs])

# *****DONT FORGET TO DELETE IN PRODUCTION************
Cart.destroy_all
LineItem.destroy_all
Order.destroy_all
DatabaseCleaner.clean_with(:truncation, :only => %w[carts])
DatabaseCleaner.clean_with(:truncation, :only => %w[line_items])
DatabaseCleaner.clean_with(:truncation, :only => %w[orders])


#try using create! so that errors pop up if attributes arent validated
CSV.foreach("#{Rails.root}/lib/assets/Photo.csv", headers: true) do |row|
     Photo.create(
        :id_num => row[0],
        :title => row[1],
        :main_category => row[2],
        :sub_category => row[3] ,
        :desc => row[5],
        :is_active => row[6],
        :artist_name => row[7],
        :year_taken => row[8],
        :format_id => row[9],
        :show_bw_conversion => row[10],
        :rotating_keyword => row[11],
        :featured_gallery => row[12],
        :camera => row[13],
        :film_type => row[14],
        :slug => row[15]
      )
end

CSV.foreach("#{Rails.root}/lib/assets/Category.csv", headers: true) do |row|
     Category.create(
        :title => row[0],
        :description => row[1],
        # :main_category => row[2],
        :super_category => row[3],
        :is_active => row[4],
        :meta_title => row[5],
        :meta_desc => row[6],
        :alt_tag => row[7],
        :main_category_id => row[8],
        :slug => row[9]

      )

end

CSV.foreach("#{Rails.root}/lib/assets/PhotoCategory.csv", headers: true) do |row|
     CategoryPhoto.create(
        :photo_id => row[0],
        :category_id => row[1]
    )
end


CSV.foreach("#{Rails.root}/lib/assets/MainCategory.csv", headers: true) do |row|
     MainCategory.create(
        :title => row[0],
        :description => row[1],
        :super_category => row[2],
        :is_active => row[3],
        :meta_title => row[4],
        :meta_desc => row[5],
        :alt_tag => row[6],
        :slug => row[7]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/Size.csv", headers: true) do |row|
     Size.create(
        :name => row[0],
        :product_weight => row[1],
        :box_weight => row[2],
        :declared_value => row[3] ,
        :price => row[4],
        :product_ads_extension => row[5],
        :format_id => row[6]
      )
end

CSV.foreach("#{Rails.root}/lib/assets/Format.csv", headers: true) do |row|
     Format.create(
        :name => row[0]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/Mat.csv", headers: true) do |row|
     Mat.create(
        :name => row[0]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/Frame.csv", headers: true) do |row|
     Frame.create(
        :name => row[0],
        :price => row[1]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/CategoryMat.csv", headers: true) do |row|
     CategoryMat.create(
        :category_id => row[0],
        :mat_id => row[1]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/TieredShipping.csv", headers: true) do |row|
     TieredShipping.create(
        :lower => row[0],
        :upper => row[1],
        :price => row[2]
      )

end

CSV.foreach("#{Rails.root}/lib/assets/Feedback.csv", headers: true) do |row|
     Feedback.create(
        :name => row[0]
      )

end

