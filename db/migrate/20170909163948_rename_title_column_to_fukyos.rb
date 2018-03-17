class RenameTitleColumnToFukyos < ActiveRecord::Migration[5.0]
  def change
  	rename_column :fukyos, :lieks_count, :likes_count
  end
end
