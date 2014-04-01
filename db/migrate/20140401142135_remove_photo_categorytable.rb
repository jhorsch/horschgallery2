class RemovePhotoCategorytable < ActiveRecord::Migration
  def change
    drop_table :photo_categories
  end
end
