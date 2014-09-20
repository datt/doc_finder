class UserRole < ActiveRecord::Base
  attr_accessible :role_id, :user_id
  # validate_presence_of_true :role_id, :user_id
  belongs_to :user
  belongs_to :role
end
