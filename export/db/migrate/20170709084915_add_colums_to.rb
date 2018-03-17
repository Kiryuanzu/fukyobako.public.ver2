class AddColumsTo < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :provider, :string
  	add_column :users, :uid, :string
  	add_column :users, :usernmae, :string, default: "anonymous"
  end
end
