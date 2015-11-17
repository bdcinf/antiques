class ProductCategoriesController < ApplicationController
	
	def index
		@categories = ProductCategory.where('status = ?', 'active').order("name ASC")
	end

	def show

	end

	def contact_us

	end

	def send_email
  		@user = params
	  	AdminMailer.send_mail(@user).deliver
	  	redirect_to "/contact_us"
	end
end
