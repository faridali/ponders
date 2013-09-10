class Slide < ActiveRecord::Base
  attr_accessible :content, :status_id, :id, :image, :remove_image, :pictures_attributes

  belongs_to :status

  validates :content, length: { minimum: 0, maximum: 200 }

  acts_as_list

  has_many :pictures

  mount_uploader :image, ImageUploader

  accepts_nested_attributes_for :pictures, allow_destroy: true

  # def remove_img
  #   File.delete("#{Rails.root}/public/uploads/slide/image/#{@slide.id}/#{@image_name}")
  #   File.delete("#{Rails.root}/public/uploads/slide/image/#{@slide.id}/thumb_#{@image_name}")
  # end
end
