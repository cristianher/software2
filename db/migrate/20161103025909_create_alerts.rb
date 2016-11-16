class CreateAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :alerts do |t|
      t.float :latitude
      t.float :longitude
      t.string :description
      t.integer :level

      t.timestamps
    end
  end
end
