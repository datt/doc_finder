require 'rest_client'
class Clinic < ActiveRecord::Base
  attr_accessible :name, :address1, :city, :state, :country, :zipcode, :contact, :lat, :long, :doctor_id
  belongs_to :doctor
  has_many :availabilities, foreign_key: :clinic_id, class_name: 'Availbility'
  has_many :appointments

  def update_lat_long
    begin
      url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}"
      response = RestClient.get url
      response = JSON.parse(response)
      response = response['results'][0]
      lat = response['geometry']['location']['lat']
      long = response['geometry']['location']['lng']
      update_attributes!(lat: lat, long: long)
    rescue Exception => e
      Rails.logger.info e.message
      p e.message
    end
  end

  def address
    add = [name, address1, city, state, country, zipcode].join("+")
    add = add.gsub(/\s+/, "")
  end
end
