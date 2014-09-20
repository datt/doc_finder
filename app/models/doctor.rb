class Doctor < ActiveRecord::Base
  attr_accessible :name, :permalink, :email, :date_of_birth, :degree, :expertise, :phone_no, :practicing, :fees, :image, :user_id
  before_create :make_permalink
  has_many :clinics, dependent: :destroy
  has_many :clinics
  has_many :appointments, through: :clinics
  belongs_to :user
  mount_uploader :image, ImageUploader


  def to_param
    permalink? ? permalink : name.parameterize
  end

  def self.find(*args)
    if block_given?
      to_a.find(*args) { |*block_args| yield(*block_args) }
    else
      find_with_ids(*args) rescue find_by_permalink(*args)
    end
  end

  def exp_in_years
    Date.today.year - experience.year
  end

  def add_user
    auto_password = Devise.friendly_token.first(10)
    user = User.find_by_email(email)
    user ||= User.create(email: email, password: auto_password, password_confirmation: auto_password)
    user.user_roles.create(role_id: Role.find_by_name('doctor').try(:id)) unless user.doctor?
    update_attributes!(user_id: user.try(:id))
  end

  protected
    def make_permalink
      doctor = Doctor.where(permalink: permalink)
      if doctor.any?
        self.permalink = "#{permalink || name.parameterize}-#{doctor.count + 1}"
      end
    end
end
