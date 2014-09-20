class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.string :name
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :cancel, default: false
      t.integer :clinic_id
      t.timestamps
    end
    add_index :appointments, :patient_id
    add_index :appointments, :clinic_id
  end
end
