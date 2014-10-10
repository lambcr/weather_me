class MoveLocationOntoSchedules < ActiveRecord::Migration
  def up
    drop_table :locations
    change_table :alert_schedules do |t|
      t.string :address
      t.float  :latitude
      t.float  :longitude
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
