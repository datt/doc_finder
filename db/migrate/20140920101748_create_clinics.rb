class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.string  :address1
      t.string  :city
      t.string  :state
      t.string  :country
      t.string  :zipcode
      t.string  :contact
      t.string  :lat
      t.string  :long
      t.integer  :doctor_id
      t.timestamps
    end
    add_index :clinics, :doctor_id
  end
end

