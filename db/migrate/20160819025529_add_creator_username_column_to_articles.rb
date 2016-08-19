class AddCreatorUsernameColumnToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :creator_username, :string
  end
end
