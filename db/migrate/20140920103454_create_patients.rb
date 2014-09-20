class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string  :contact
      t.string  :address
      t.integer :user_id
      t.timestamps
    end
  end
end
