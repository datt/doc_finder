json.doctors @doctors do |doctor|
  json.id doctor.id
  json.name doctor.name
  json.date_of_birth doctor.date_of_birth
  json.email doctor.email
  json.degree doctor.degree
  json.expertise doctor.expertise
  json.experience doctor.experience
  json.visiting_fees doctor.visiting_fee
  json.image doctor.image.url
  json.clinics do |clinic|
    json.id clinic.id
    json.name clinic.name
    json.lat clinic.lat
    json.lng clinic.long
  end
end
