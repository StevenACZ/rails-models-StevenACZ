class CreateCritics < ActiveRecord::Migration[6.0]
  def change
    create_table :critics do |t|
      t.string :body

      t.timestamps
    end
  end
end
