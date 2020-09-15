class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :customer_id
      t.integer :physician_id

      t.timestamps
    end
    add_index :appointments, :customer_id
    add_index :appointments, :physician_id
  end
end
