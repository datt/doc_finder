class AddColumnsToDoctors < ActiveRecord::Migration
  def change
  	add_column :doctors, :degree, :string
  	add_column :doctors, :expertise, :text
  	add_column :doctors, :phone_no, :string
  	add_column :doctors, :practicing, :date
  	add_column :doctors, :fees, :float
  end
end
