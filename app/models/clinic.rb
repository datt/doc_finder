class Clinic < ActiveRecord::Base
  attr_accessible :name, :address1, :city, :state, :country, :zipcode, :contact, :lat, :long, :doctor_id
  belongs_to :doctor
  has_many :availabilities, foreign_key: :clinic_id, class_name: 'Availbility'
  has_many :appointments
end
