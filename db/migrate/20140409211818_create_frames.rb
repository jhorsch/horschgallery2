class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
