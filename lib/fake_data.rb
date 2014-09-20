class FakeData
  def self.doctor(number=10)
    number.times do |i|
      doctor = Doctor.new(:name => Faker::Name.name, :date_of_birth => Time.now - Random.rand(50).years, :experience => (Time.now - Random.rand(25).years).to_date, :email => Faker::Internet.email("vishal#{i}"), :degree => DEGREE.sample, :expertise => SPECIALTIES.sample, :phone_no => Faker::Number.number(10), :fees => Faker::Number.number(3), :meta_keyword => META_KEY.sample(2).join(','))
      doctor.save
      doctor.add_user
      limit = (Random.rand(5)+1)
      area = Area.limit(limit)
      limit.times do |j|
        clinic = doctor.clinics.create(:name => Faker::Name.name,
          address1: area[j].name,
          city: area[j].city,
          zipcode: area[j].zipcode,
          country: 'India',
          contact: Faker::Number.number(10),
          state: 'Maharashtra'
        )
        clinic.update_lat_long
      end
    end
  end
end