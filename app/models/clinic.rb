class Clinic < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doctor
  has_many :availbilites
  has_many :appointments
end
