class AddFieldsToModels < ActiveRecord::Migration
  def change
    add_column :doctors, :meta_keyword, :string
    add_column :doctors, :experience, :date
    add_column :doctors, :visiting_fee, :decimal, precision: 5, scale: 2
  end
end
