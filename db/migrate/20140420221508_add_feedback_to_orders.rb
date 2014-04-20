class AddFeedbackToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :feedback_type, :string
  end
end
