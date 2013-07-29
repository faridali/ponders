class Picture < ActiveRecord::Base
  attr_accessible :status_id, :image
  belongs_to :slide
  mount_uploader :image, ImageUploader
end