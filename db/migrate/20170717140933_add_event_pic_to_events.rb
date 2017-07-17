class AddEventPicToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_pic, :string
  end
end
