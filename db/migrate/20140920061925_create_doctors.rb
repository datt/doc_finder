class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
    	t.string :name
    	t.date :date_of_birth
    	t.integer :age
    	t.string :email
      t.timestamps
    end
    add_index :doctors, :email,		unique: true
  end
end
