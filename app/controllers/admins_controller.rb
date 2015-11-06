class AdminsController < ApplicationController
	layout 'admin'

	def show
		render :layout => false
	end

	def update_subcat

		@subcategories = ProductSubcategory.where(:product_category_id => params[:product_category_id]).order('name ASC')
		if @subcategories.empty?
			render :partial => "subcat", :object => { :subcategories => @subcategories }
		else
			@subsubcategories = ProductSubsubcategory.where(:product_subcategory_id => @subcategories.first.id)
			render :partial => "subcat", :object => { :subcategories => @subcategories, :subsubcategories => @subsubcategories }
		end
	end

	def update_subsubcat
		@subsubcategories = ProductSubsubcategory.where(:product_subcategory_id => params[:product_subcategory_id]).order('name ASC')
  		render :partial => "subsubcat", :object => @subsubcategories
	end

	def update_subcat_for_subcat_lvl_1
		@subcategories = ProductSubcategory.where(:product_category_id => params[:product_category_id]).order('name ASC')
  		render :partial => "subcat_for_lvl_1", :object => @subcategories
	end

	# Product related actions 
	# Actions new, create, edit, update,delete

	def show_products
		if params[:product_subsubcategory_id].nil?
			if params[:product_subcategory_id].nil?
				@products = Product.where('product_category_id = ?', params[:product_category_id])
			else
				@products = Product.where('product_subcategory_id = ?', params[:product_subcategory_id])
			end
		else
			@products = Product.where('product_subsubcategory_id = ?', params[:product_subsubcategory_id])
		end
	end	

	def new
		@categories = ProductCategory.order( 'name ASC' )
  		@subcategories = ProductSubcategory.order( 'name ASC' )
		@product = Product.new
		@product_image = ProductImage.new
	end

	def create
		@categories = ProductCategory.order( 'name ASC' )
  		@subcategories = ProductSubcategory.order( 'name ASC' )
		@product = Product.new(params[:product])

	  	respond_to do |format|
		    if @product.save
		      if params[:images]
		        params[:images].each { |image|
		          @product.product_images.create(image: image)
		        }
		      end

		      format.html { redirect_to :controller => "admins",:action=>"admin_info", notice: 'Product was successfully created.' }
		      format.json { render json: @product, status: :created, location: @product }
		    else
		      format.html { render action: "new", :object => @categories, :object => @subcategories }
		      format.json { render json: @product.errors, status: :unprocessable_entity }
		    end
	  	end
	end

	def edit
		@categories = ProductCategory.order( 'name ASC' )
  		@subcategories = ProductSubcategory.order( 'name ASC' )
		@product = Product.find(params[:id].to_i)
		@selected_category = ProductCategory.where(:id => @product.product_category_id)
		@selected_subcategory = ProductSubcategory.where(:id => @product.product_subcategory_id)

	end

	def update
		@product = Product.find(params[:id].to_i)

	  	respond_to do |format|
		    if @product.update_attributes(params[:product])
		     
		      if params[:images]
		        #===== The magic is here ;)
		        params[:images].each { |image|
		          @product.product_images.create(image: image)
		        }
		      end

		      format.html { redirect_to session.delete(:return_to), notice: 'Product was successfully created.' }
		      format.json { render json: @product, status: :created, location: @product }
		    else
		      format.html { render action: "edit" }
		      format.json { render json: @product.errors, status: :unprocessable_entity }
		    end
	  	end
	end

	def delete
		@product = Product.find(params[:id].to_i)
		@product.destroy
		respond_to do |format|
		  format.html { redirect_to(:back) }
		  format.json { head :no_content }
		end
	end


	# Category related decisions
	# Actions new, create, edit, update,delete

	def show_categories
		@categories = ProductCategory.order('name ASC')
	end

	def new_category
		@category = ProductCategory.new
	end

	def create_category
		@category = ProductCategory.new(params[:product_category])

	  	respond_to do |format|
		    if @category.save
		      format.html { redirect_to :controller => "admins",:action=>"admin_info", notice: 'Category was successfully created.' }
		      format.json { render json: @category, status: :created, location: @category }
		    else
		      format.html { render action: "new_category" }
		      format.json { render json: @category.errors, status: :unprocessable_entity }
		    end
	  	end
	end

	def edit_category
		@category = ProductCategory.find(params[:id].to_i)
	end

	def update_category
		@category = ProductCategory.find(params[:id].to_i)

	  	respond_to do |format|
		    if @category.update_attributes(params[:product_category])
		      format.html { redirect_to session.delete(:return_to), notice: 'Category was successfully created.' }
		      format.json { render json: @category, status: :created, location: @category }
		    else
		      format.html { render action: "edit_category" }
		      format.json { render json: @category.errors, status: :unprocessable_entity }
		    end
	  	end
	end

	def delete_category
		@category = ProductCategory.find(params[:id].to_i)
		@category.destroy
		respond_to do |format|
		  format.html { redirect_to(:back) }
		  format.json { head :no_content }
		end
	end

	# Subcategory related decisions
	# Actions new, create, edit, update,delete

	def show_subcategories
		@subcategories = ProductSubcategory.where(:product_category_id => params[:id].to_i).order('name ASC')
		if @subcategories.empty?
			redirect_to :controller => 'admins', :action => 'show_products', :product_category_id => params[:id], :product_subcategory_id => nil
		end
	end

	def new_subcategory
		@categories = ProductCategory.order('name ASC')
		@subcategory = ProductSubcategory.new
	end

	def create_subcategory
		@subcategory = ProductSubcategory.new(params[:product_subcategory])

	  	respond_to do |format|
		    if @subcategory.save
		      format.html { redirect_to :controller => "admins",:action=>"admin_info", notice: 'Subcategory was successfully created.' }
		      format.json { render json: @subcategory, status: :created, location: @subcategory }
		    else
		      format.html { render action: "new_subcategory" }
		      format.json { render json: @subcategory.errors, status: :unprocessable_entity }
		    end
	  	end
	end

	def edit_subcategory
		@subcategory = ProductSubcategory.find(params[:id].to_i)
	end

	def update_subcategory
	  	@subcategory = ProductSubcategory.find(params[:id].to_i)

	  	respond_to do |format|
		    if @subcategory.update_attributes(params[:product_subcategory])
		      format.html { redirect_to session.delete(:return_to), notice: 'Subcategory was successfully created.' }
		      format.json { render json: @subcategory, status: :created, location: @subcategory }
		    else
		      format.html { render action: "edit_subcategory" }
		      format.json { render json: @subcategory.errors, status: :unprocessable_entity }
		    end
	  	end
	end


	def delete_subcategory
		@subcategory = ProductSubcategory.find(params[:id].to_i)
		@subcategory.destroy
		respond_to do |format|
		  format.html { redirect_to(:back) }
		  format.json { head :no_content }
		end
	end

	# Subsubcategory related decisions
	# Actions new, create, edit, update,delete

	def show_subsubcategories
		@subsubcategories = ProductSubsubcategory.where(:product_subcategory_id => params[:id].to_i).order('name ASC')
		@subcateory = ProductSubcategory.find(params[:id].to_i)
		@category = ProductCategory.find(@subcateory.product_category_id)
		if @subsubcategories.empty?
			redirect_to :controller => 'admins', :action => 'show_products',:product_category_id => @category.id, :product_subcategory_id => params[:id].to_i, :product_subsubcategory_id => nil
		end
	end

	def new_subsubcategory
		@categories = ProductCategory.order('name ASC')
		@subcategories = ProductSubcategory.order('name ASC')
		@subsubcategory = ProductSubsubcategory.new
	end

	def create_subsubcategory
		@subsubcategory = ProductSubsubcategory.new(params[:product_subsubcategory])

	  	respond_to do |format|
		    if @subsubcategory.save
		      format.html { redirect_to :controller => "admins",:action=>"admin_info", notice: 'Subcategory Level 1 was successfully created.' }
		      format.json { render json: @subsubcategory, status: :created, location: @subsubcategory }
		    else
		      format.html { render action: "new_subsubcategory" }
		      format.json { render json: @subsubcategory.errors, status: :unprocessable_entity }
		    end
	  	end
	end

	def edit_subsubcategory
		@subsubcategory = ProductSubsubcategory.find(params[:id].to_i)
	end

	def update_subsubcategory
	  	@subsubcategory = ProductSubsubcategory.find(params[:id].to_i)

	  	respond_to do |format|
		    if @subsubcategory.update_attributes(params[:product_subsubcategory])
		      format.html { redirect_to session.delete(:return_to), notice: 'Subcategory Level 1was successfully created.' }
		      format.json { render json: @subcategory, status: :created, location: @subcategory }
		    else
		      format.html { render action: "edit_subsubcategory" }
		      format.json { render json: @subsubcategory.errors, status: :unprocessable_entity }
		    end
	  	end
	end


	def delete_subsubcategory
		@subsubcategory = ProductSubsubcategory.find(params[:id].to_i)
		@subsubcategory.destroy
		respond_to do |format|
		  format.html { redirect_to(:back) }
		  format.json { head :no_content }
		end
	end

	# Other actions

	def admin_info
		@categories = ProductCategory.order('name ASC')
	end

	def check_login
		if params[:user] == "admin" && params[:password] == "admin"
			redirect_to :controller =>'admin',:action => 'admin_info'
			flash[:message] = "Successful"
		else
			redirect_to "/admin"
			flash[:message] = "Invalid User!"
		end	
	end


	private

 	# def product_params
  #   	params.require(:product).permit(:name, :product_id, :price, :product_category_id, :product_subcategory_id, :product_subsubcategory_id, :description, :status, :img_file, :_destroy_img_file , product_images_attributes: [:id, :image, :_destroy])
  # 	end

  # 	def product_category_params
  # 		params.require(:product_category).permit(:name, :description, :img_file, :_destroy_img_file)
  # 	end

  # 	def product_subcategory_params
  # 		params.require(:product_subcategory).permit(:product_category_id, :name, :description, :img_file, :_destroy_img_file)
  # 	end

  # 	def product_subsubcategory_params
  # 		params.require(:product_subsubcategory).permit(:product_category_id,:product_subcategory_id, :name, :description, :img_file, :_destroy_img_file)
  # 	end
end
