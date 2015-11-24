class Slider < ActiveRecord::Base
  attr_accessible :image
  has_attached_file :image, 
    :default_url => "/images/:style/missing.png",
    :path => ":rails_root/public/slider_images/:id/:image",
    :url  => "/slider_images/:id/:image"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], presence: true
end
