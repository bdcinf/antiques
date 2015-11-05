class ProductSubsubcategoriesController < ApplicationController
	def show
		@subcategory = ProductSubcategory.find(params[:id].to_i)
		@category = ProductCategory.find(@subcategory.product_category_id)
		# puts "==========================="
		# puts @subcategory.product_subsubcategories.empty?
		# puts "==========================="
		if @subcategory.product_subsubcategories.empty?
			# puts "============"
			# puts @category.id
			# puts @subcategory.id
			# puts "============"
			redirect_to :controller => 'products', :action => 'index', :product_category_id => @category.id, :product_subcategory_id => @subcategory.id, :product_subsubcategory_id => nil
		end
	end
end
