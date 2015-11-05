class ProductSubcategoriesController < ApplicationController
	def show
		@category = ProductCategory.find(params[:id].to_i)
		# puts "==========================="
		# puts @category.product_subcategories.empty?
		# puts "==========================="
		if @category.product_subcategories.empty?
			# puts "============"
			# puts @category.id
			# puts "============"
			redirect_to :controller => 'products', :action => 'index', :product_category_id => @category.id, :product_subcategory_id => nil
		end
	end
end
