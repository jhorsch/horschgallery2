class Format < ActiveRecord::Base
  has_many :sizes , dependent: :destroy
end
