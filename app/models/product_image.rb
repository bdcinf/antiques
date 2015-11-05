class ProductImage < ActiveRecord::Base
  attr_accessible :id, :image, :_destroy
  before_save(on: :update) do
	 :destroy?
	end

	belongs_to :product

  has_attached_file :image, 
    :default_url => "/images/:style/missing.png",
    :path => ":rails_root/public/product_images/:id/:image",
    :url  => "/product_images/:id/:image"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], presence: true

  def _destroy
    @_destroy ||= "0"
  end

  def _destroy=(value)
    @_destroy = value
  end

  private
  def destroy?
    self.image.clear if @_destroy == "1"
  end
end
