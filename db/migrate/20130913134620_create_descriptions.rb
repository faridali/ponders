class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.text :body
      t.references :user

      t.timestamps
    end
    add_index :descriptions, :user_id
  end
end
