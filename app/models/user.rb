class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :patient_attributes
  # attr_accessible :title, :body
  has_many :user_roles
	has_many :roles, through: :user_roles
  has_one :patient
  # validates :patient, presence: true, :if => :patient?
  accepts_nested_attributes_for :patient

	Role.order('name').each do |role|
		define_method("#{role.name}?") do
			roles.include? role
		end
	end
end
