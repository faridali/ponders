class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :slide

      t.timestamps
    end

    add_index :pictures, :slide_id
  end
end
