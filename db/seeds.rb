# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create roles
roles = [{name: 'patient', display_name: 'Patient'}, {name: 'admin', display_name: 'Admin'}, {name: 'doctor', display_name: 'Doctor'}]
ActiveRecord::Base.connection.execute('truncate roles');
Role.create!(roles)

# create Admin

user = User.create(email: 'admin@docfinder.com', password: 'docfinder@123', password_confirmation: 'docfinder@123')
p "email is admin@docfinder.com & password is docfinder@123"
user.user_roles.create(role_id: Role.find_by_name('admin'))