class CreatePools < ActiveRecord::Migration[6.0]
  def change
    create_table :pools do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
