class CreateUserTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tokens, id: :uuid do |t|
      t.uuid :token, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
