class ProductSubcategory < ActiveRecord::Base
  attr_accessible :product_category_id, :name, :description, :status, :img_file, :_destroy_img_file
  belongs_to :product_category, :polymorphic => true
  	has_many :product_subsubcategories, :dependent => :destroy

  	has_attached_file :img_file,
	    :default_url => "/images/:style/missing.png",
	    :path => ":rails_root/public/product_subcategory_images/:id/:img_file",
	    :url  => "/product_subcategory_images/:id/:img_file"
	validates_attachment_content_type :img_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	validates :name, presence: true, length: { maximum: 255 }
  	validates :description, presence: true, length: {maximum: 4000 }
  	validates :img_file, presence: true
end
