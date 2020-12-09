class AddUserRefToCritics < ActiveRecord::Migration[6.0]
  def change
    add_reference :critics, :user, null: false, foreign_key: true
  end
end
