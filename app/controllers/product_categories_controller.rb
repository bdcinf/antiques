class ProductCategoriesController < ApplicationController
	
	def index
		@categories = ProductCategory.where('status = ?', 'active').order("name ASC")
		@sliders = Slider.all
	end

	def show

	end

	def contact_us

	end

	def send_email
  		@email = Email.new(params[:email])
  		respond_to do |format|
		    if @email.save
		    	@email = Email.last
		      AdminMailer.send_mail(@email).deliver
		      format.html { redirect_to "/contact_us", notice: 'Category was successfully created.' }
		      format.json { render json: @email, status: :created, location: @email }
		    else
		      format.html { render action: "contact_us" }
		      format.json { render json: @email.errors, status: :unprocessable_entity }
		    end
	  	end
	end
end
