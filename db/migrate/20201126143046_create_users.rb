class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday_date
      t.string :email
      t.string :password
      t.string :description
      t.string :avatar
      t.string :phone_number
      t.string :telegram
      t.string :facebook
      t.string :whatsapp

      t.timestamps
    end
  end
end
