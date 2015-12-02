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
  		# if !params[:image_file]
  		# 	params[:image_file] = nil
  		# end
  		respond_to do |format|
		    if @email.save
		    	@email = Email.last
		      AdminMailer.send_mail(@email).deliver
		      format.html { redirect_to "/contact_us", notice: 'Thank you. We will get back in touch with you soon!' }
		      format.json { render json: @email, status: :created, location: @email }
		    else
		      format.html { render action: "contact_us" }
		      format.json { render json: @email.errors, status: :unprocessable_entity }
		    end
	  	end
	end
end
