class CategoryMat < ActiveRecord::Base
  belongs_to :category
  belongs_to :mat
end
