class AddDesctoAlert < ActiveRecord::Migration[5.0]
  def change
  	add_column :alerts, :desc, :text
  end
end
