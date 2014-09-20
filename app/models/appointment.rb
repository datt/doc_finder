class Appointment < ActiveRecord::Base
  attr_accessible :patient_id, :clinic_id, :start_at, :end_at, :name

  validates  :start_at, :end_at, presence: true
  belongs_to :patient
  belongs_to :clinic

  scope :active, -> { where(cancel: false) }
end
