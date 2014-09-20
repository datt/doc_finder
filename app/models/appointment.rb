class Appointment < ActiveRecord::Base
  attr_accessible :patient_id, :day, :time, :clinic_id

  validates :day, :time, presence: true
  belongs_to :patient
  belongs_to :clinic
end
