class Slide < ActiveRecord::Base
  attr_accessible :content, :status_id, :id, :image, :remove_image, :pictures_attributes

  belongs_to :status

  acts_as_list

  has_many :pictures

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :pictures, allow_destroy: true

  private
 
  def image_size_validation
    errors[:image] << "should be less than 5MB" if image.size > 5.megabytes
  end

  # def remove_img
  #   File.delete("#{Rails.root}/public/uploads/slide/image/#{@slide.id}/#{@image_name}")
  #   File.delete("#{Rails.root}/public/uploads/slide/image/#{@slide.id}/thumb_#{@image_name}")
  # end

end
