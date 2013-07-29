class AddSlideIdToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :slide_id, :integer
  	add_index :pictures, :slide_id
  end
end
