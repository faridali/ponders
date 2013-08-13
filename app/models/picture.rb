class Picture < ActiveRecord::Base
  attr_accessible :slide_id, :image
  belongs_to :slide
  mount_uploader :image, ImageUploader
end