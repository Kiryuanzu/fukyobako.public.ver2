class RemoveusernmaeFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :usernmae, :string, default: "anonymous"
  	add_column :users, :username, :string, default: "anonymous"
  end
end
