class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :username, :string
  	add_column :users, :photo, :string, :null => true
  end
end
