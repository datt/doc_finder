class Clinic < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :doctor
end
