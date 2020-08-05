class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.references :pool, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.bigint :companion_id # is a user

      t.timestamps
    end
  end
end
