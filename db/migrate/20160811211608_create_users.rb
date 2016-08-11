class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :encrypted_password
      t.string :salt
      t.string :organization
      t.string :address_street
      t.string :address_city
      t.string :address_state
      t.string :address_country
      t.string :email

      t.timestamps null: false
    end
  end
end
