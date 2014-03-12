class AddAdsToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :product_ads_extension, :string
  end
end
