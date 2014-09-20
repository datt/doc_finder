class AddFieldsToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :permalink, :string
  end
end
