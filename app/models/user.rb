class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :patient_attributes
  # attr_accessible :title, :body
  has_many :user_roles, dependent: :destroy
	has_many :roles, through: :user_roles
  has_one :patient
  has_one :doctor
  # validates :patient, presence: true, :if => :patient?
  # validates :doctor, presence: true, :if => :doctor?
  accepts_nested_attributes_for :patient

	Role.order('name').each do |role|
		define_method("#{role.name}?") do
			roles.include? role
		end
	end

  def self.from_omniauth(auth)
    ap auth
    auto_password = Devise.friendly_token.first(10)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.password = auto_password
      user.password_confirmation = auto_password
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      begin
        user.build_patient(name: auth.info.name, :age => Date.today.year - auth.extra.raw_info.birthday.to_date.year)
      rescue Exception => e
        Rails.logger.info e.message
      end
      user.save!
      user.user_roles.create(role_id: Role.find_by_name('patient').try(:id)) unless user.patient?
    end
  end
end
