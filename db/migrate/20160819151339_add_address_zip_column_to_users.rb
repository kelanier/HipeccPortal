class AddAddressZipColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address_zip, :string
  end
end
