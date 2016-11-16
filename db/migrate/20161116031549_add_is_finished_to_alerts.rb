class AddIsFinishedToAlerts < ActiveRecord::Migration[5.0]
  def change
  	add_column :alerts, :is_finished, :boolean, default: false
  end
end
