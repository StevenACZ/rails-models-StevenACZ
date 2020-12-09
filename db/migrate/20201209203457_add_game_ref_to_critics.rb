class AddGameRefToCritics < ActiveRecord::Migration[6.0]
  def change
    add_reference :critics, :game, null: false, foreign_key: true
  end
end
