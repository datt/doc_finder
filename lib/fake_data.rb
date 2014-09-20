class FakeData
  def self.doctor(number=10)
    number.times do |i|
      doctor = Doctor.new(:name => Faker::Name.name, :date_of_birth => Time.now - (10+i).years, :email => Faker::Internet.email("vishal#{i}"), :degree => DEGREE.sample, :expertise => SPECIALTIES.sample, :phone_no => Faker::Number.number(10), :fees => Faker::Number.number(3))
      doctor.save
      limit = (Random.rand(5)+1)
      area = Area.limit(limit)
      limit.times do |j|
        clinic = doctor.clinics.create(:name => Faker::Name.name,
          address1: area[j].name,
          city: area[j].city,
          zipcode: area[j].zipcode,
          country: 'India',
          state: 'Maharashtra'
        )
        clinic.update_lat_long
      end
    end
  end
end