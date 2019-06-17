class AddMedalTEventMedalists < ActiveRecord::Migration[5.2]
  def change
    add_column :event_medalists, :medal, :integer
  end
end
