class Clinic < ActiveRecord::Base
  attr_accessible :name, :city, :state, :country, :contact
  belongs_to :doctor
  has_many :availabilities, foreign_key: :clinic_id, class_name: 'Availbility'
  has_many :appointments
end
