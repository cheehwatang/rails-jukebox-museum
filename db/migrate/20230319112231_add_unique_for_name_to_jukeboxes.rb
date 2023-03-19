class AddUniqueForNameToJukeboxes < ActiveRecord::Migration[7.0]
  def change
    add_index :jukeboxes, :name, unique: true
  end
end
