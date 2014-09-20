class Patient < ActiveRecord::Base
  attr_accessible :name, :age, :address, :contact, :user_id
  has_many :appointments
  belongs_to :user
end
