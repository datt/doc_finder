class Availbility < ActiveRecord::Base
  attr_accessible :clinic_id, :day, :from, :to
  belongs_to :clinic
end
