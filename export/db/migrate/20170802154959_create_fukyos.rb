class CreateFukyos < ActiveRecord::Migration[5.0]
  def change
    create_table :fukyos do |t|
      t.string :title
      t.text   :detail
      t.string :URL
      t.integer :user_id

      t.timestamps
    end
  end
end
