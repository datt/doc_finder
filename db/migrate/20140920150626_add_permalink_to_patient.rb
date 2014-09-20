class AddPermalinkToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :permalink, :string
  end
end
