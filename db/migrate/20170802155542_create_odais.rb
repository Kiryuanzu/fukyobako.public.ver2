class CreateOdais < ActiveRecord::Migration[5.0]
  def change
    create_table :odais do |t|
    	t.string :detail
    	t.integer :user_id

      t.timestamps
    end
  end
end
