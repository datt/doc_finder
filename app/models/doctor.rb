class Doctor < ActiveRecord::Base
  attr_accessible :name, :permalink, :email, :date_of_birth
  before_update :make_permalink
  before_create :make_permalink
  has_many :clinics

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

  protected
    def make_permalink
      doctor = Doctor.where(permalink: permalink)
      if doctor.any?
        self.permalink = "#{permalink || name.parameterize}-#{doctor.count + 1}"
      end
    end
end
