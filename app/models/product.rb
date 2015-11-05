class Product < ActiveRecord::Base
  attr_accessible :name, :product_var_id, :price, :product_category_id, :product_subcategory_id, :product_subsubcategory_id, :description, :status, :img_file, :_destroy_img_file, :product_images_attributes
  before_save :destroy_img_file?

	belongs_to :product_subcategory
	belongs_to :product_category
	has_many :product_images, :dependent => :destroy

	has_attached_file :img_file,
	    :default_url => "/images/:style/missing.png",
	    :path => ":rails_root/public/product_images/:id/:img_file",
	    :url  => "/product_images/:id/:img_file"
	validates_attachment_content_type :img_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], presence: true
 
	accepts_nested_attributes_for :product_images, allow_destroy: true

	validates :name, presence: true, length: { maximum: 255 }
	validates :product_var_id, presence: true, length: { maximum: 10 }
	validates :price, presence: true
  	validates :description, presence: true, length: {maximum: 4000 }
  	validates :img_file, presence: true

	private

	def destroy_img_file?
		puts "======================="
		puts @_destroy_img_file
		puts "======================="
    	self.img_file.clear if @_destroy_img_file == "1"
  	end
end
