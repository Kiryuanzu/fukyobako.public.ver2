class AddlikesCountToFukyos < ActiveRecord::Migration[5.0]
  def change
  	add_column :fukyos, :lieks_count, :integer
  end
end
