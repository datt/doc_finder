class Doctor < ActiveRecord::Base
  attr_accessible :name, :permalink, :email, :date_of_birth, :degree, :expertise, :phone_no, :practicing, :fees, :image, :user_id
  before_create :make_permalink
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

  def add_user
    auto_password = Devise.friendly_token.first(10)
    user = User.find_by_email(email)
    user ||= User.create(email: email, password: auto_password, password_confirmation: auto_password)
    user.user_roles.create(role_id: Role.find_by_name('doctor').try(:id)) unless user.doctor?
    update_attributes!(user_id: user.try(:id))
  end

  def self.like_any(fields, values)
    where fields.map { |field|
      values.map { |value|
        arel_table[field].matches("%#{value}%")
      }.inject(:or)
    }.inject(:or)
  end

  def self.search(query)
    joins(:clinics).where("doctors.name like ? or doctors.degree like ? or doctors.expertise like ? or doctors.practicing like ? or doctors.fees like ? or doctors.meta_keyword like ? or doctors.experience like ? or doctors.visiting_fee like ? or clinics.name like ? or clinics.address1 like ? or clinics.city like ? or clinics.state like ? or clinics.country like ? or clinics.zipcode like ? ", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
  end
  protected
    def make_permalink
      doctor = Doctor.where(permalink: permalink)
      if doctor.any?
        self.permalink = "#{permalink || name.parameterize}-#{doctor.count + 1}"
      end
    end
end
