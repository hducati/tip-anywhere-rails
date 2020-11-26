class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.date :birthday_date
      t.string :email, :unique => true
      t.string :password
      t.string :description, :null => true
      t.string :avatar, :null => true
      t.string :phone_number, :null => true, :limit => 13 #By default SQL String limit 255 character 
      t.string :telegram, :null => true
      t.string :facebook, :null => true
      t.string :whatsapp, :null => true

      t.timestamps
    end
  end
end
