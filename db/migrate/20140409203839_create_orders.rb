class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :is_confirmed, null: false, default: false

      t.timestamps
    end
  end
end
