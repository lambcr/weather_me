class AddAlertSchedule < ActiveRecord::Migration
  def change
    create_table :alert_schedules do |t|
      t.string :name
      t.integer :created_by
      t.references :location

      t.timestamps
    end
  end
end
