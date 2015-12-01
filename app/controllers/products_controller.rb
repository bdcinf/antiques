class ProductsController < ApplicationController

	def index
		if params[:product_subsubcategory_id].nil?
			if params[:product_subcategory_id].nil?
				@products = Product.where('product_category_id = ? AND status = ?', params[:product_category_id], 'active')
				@category = ProductCategory.find(params[:product_category_id])
			else
				@products = Product.where('product_category_id = ? AND product_subcategory_id = ? AND status = ?', params[:product_category_id], params[:product_subcategory_id], 'active')
				@category = ProductCategory.find(params[:product_category_id])
				@subcategory = ProductSubcategory.find(params[:product_subcategory_id])
			end
		else
			@products = Product.where('product_category_id = ? AND product_subcategory_id = ? AND product_subsubcategory_id = ? AND status = ?', params[:product_category_id], params[:product_subcategory_id], params[:product_subsubcategory_id], 'active')
			@category = ProductCategory.find(params[:product_category_id])
			@subcategory = ProductSubcategory.find(params[:product_subcategory_id])
			@subsubcategory = ProductSubsubcategory.find(params[:product_subsubcategory_id])
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def search
		@search_results = Product.where("lower(name) LIKE ?", "%#{params[:search]}%".downcase).paginate(:page => params[:page], :per_page => 16)
	end
end
