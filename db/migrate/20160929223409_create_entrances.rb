class CreateEntrances < ActiveRecord::Migration[5.0]
  def change
    create_table :entrances do |t|
      t.string :email
      t.string :clase
      t.string :level
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
