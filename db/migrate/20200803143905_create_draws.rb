class CreateDraws < ActiveRecord::Migration[6.0]
  def change
    create_table :draws do |t|
      t.references :pool, null: false, foreign_key: true

      t.timestamps
    end
  end
end
