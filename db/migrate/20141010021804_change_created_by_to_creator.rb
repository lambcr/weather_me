class ChangeCreatedByToCreator < ActiveRecord::Migration
  def change
    change_table :alert_schedules do |t|
      t.rename :created_by, :creator_id
    end
  end
end
