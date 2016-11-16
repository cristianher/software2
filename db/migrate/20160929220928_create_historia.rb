class CreateHistoria < ActiveRecord::Migration[5.0]
  def change
    create_table :historia do |t|
      t.text :body

      t.timestamps
    end
  end
end
