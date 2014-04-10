class AddFrameIdToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :frame, index: true
    remove_column :line_items, :frame_style
  end
end
