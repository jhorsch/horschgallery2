class Feedback < ActiveRecord::Base
  scope :sort_down, -> { all.order('name asc') }


end
