class Patient < ActiveRecord::Base
  attr_accessible :name, :age, :address, :contact, :user_id, :permalink
  has_many :appointments
  belongs_to :user
  before_update :make_permalink
  before_create :make_permalink
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
      patient = Patient.where(permalink: permalink)
      if patient.any?
        self.permalink = "#{permalink || name.parameterize}-#{patient.count + 1}"
      else
        self.permalink = permalink
      end
    end
end
