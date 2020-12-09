class CreateTips < ActiveRecord::Migration[6.0]
  def change
    create_table :tips, id: :uuid do |t|
      t.float :odd
      t.string :sport
      t.string :tip
      t.string :league
      t.string :game
      t.float :unit
      t.string :description
      t.string :status
      t.boolean :closed
      t.datetime :scheduled_at
      
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
