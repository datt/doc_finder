class Clinic < ActiveRecord::Base
  attr_accessible :name, :address1, :city, :state, :country, :zipcode, :contact, :lat, :long, :doctor_id
  belongs_to :doctor
  has_many :availbilites
  has_many :appointments
end
