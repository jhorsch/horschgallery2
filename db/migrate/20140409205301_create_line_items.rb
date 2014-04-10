class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :photo, index: true
      t.belongs_to :size, index: true
      t.belongs_to :mat, index: true
      t.string :frame_style
      t.boolean :convert_to_bw, null: false, default: false
      t.integer :quanitity, null:false, default: 1

      t.timestamps
    end
  end
end
