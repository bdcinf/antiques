class Email < ActiveRecord::Base
  attr_accessible :name, :mail, :phone, :image_file, :subject, :message

	has_attached_file :image_file, 
		:default_url => "/images/:style/missing.png",
		:path => ":rails_root/public/mail_images/:id/:image_file",
		:url  => "/mail_images/:id/:image_file"
	validates_attachment_content_type :image_file, :content_type => %w(image/jpeg image/jpg image/png image/gif)
	validates :name, presence: true, length: { maximum: 255 }
	validates :mail, presence: true, length: {maximum: 255 }
	validates :phone, presence: true,length: { maximum: 15 }
	validates :subject, presence: true, length: { maximum: 255 }
	validates :message, presence: true, length: { maximum: 4000 }
end
