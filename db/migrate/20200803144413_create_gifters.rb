class CreateGifters < ActiveRecord::Migration[6.0]
  def change
    create_table :gifters do |t|
      t.references :draw, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
