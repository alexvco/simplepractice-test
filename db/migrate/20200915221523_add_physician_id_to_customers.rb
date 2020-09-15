class AddPhysicianIdToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :physician_id, :integer
    add_index :customers, :physician_id
  end
end
