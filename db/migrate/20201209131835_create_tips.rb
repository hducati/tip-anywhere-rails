class CreateTips < ActiveRecord::Migration[6.0]
  def change
    create_table :tips, id: :uuid do |t|
      t.float :odd, :null => false
      t.string :sport
      t.string :tip, :null => false
      t.string :league
      t.string :game, :null => false
      t.float :unit, :null => false
      t.string :description
      t.string :status, :null => false
      t.boolean :closed, default: -> { 'false' }
      t.column :scheduled_at, 'timestamp with time zone', default: -> { "CURRENT_TIMESTAMP + interval '1' hour" }
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
