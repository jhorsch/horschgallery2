class Category < ActiveRecord::Base
  has_many :photos, dependent: :destroy

end
