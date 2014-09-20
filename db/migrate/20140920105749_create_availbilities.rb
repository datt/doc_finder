class CreateAvailbilities < ActiveRecord::Migration
  def change
    create_table :availbilities do |t|
      t.string :day
      t.datetime :from
      t.datetime :to
      t.integer :clinic_id

      t.timestamps
    end
  end
end
