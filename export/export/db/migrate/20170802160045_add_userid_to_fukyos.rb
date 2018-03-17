class AddUseridToFukyos < ActiveRecord::Migration[5.0]
  def change
  	add_column :fukyos, :odai_id, :integer
  end
end
