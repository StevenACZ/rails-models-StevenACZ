class RemovePartGameIdFromCritics < ActiveRecord::Migration[6.0]
  def change
    remove_column :critics, :game_id, :integer
  end
end
