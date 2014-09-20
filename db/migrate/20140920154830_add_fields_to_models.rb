class AddFieldsToModels < ActiveRecord::Migration
  def change
    add_column :doctors, :meta_keyword, :string
    add_column :doctors, :experience, :string
    add_column :doctors, :visiting_fee, :string
  end
end
