class RemoveImageFromSlides < ActiveRecord::Migration
  def up
    remove_column :slides, :image
  end

  def down
    add_column :slides, :image, :string
  end
end
