module ApplicationHelper
	 def check_has_dropdown_category category
    	if !category.product_subcategories.empty?
    		data = "off-canvas-submenu-call"
  			data.html_safe
    	else
    		data = ""
  			data.html_safe
    	end
  	end

  	def check_has_dropdown_subcategory subcategory
    	if !subcategory.product_subsubcategories.empty?
    		data = "off-canvas-submenu-call"
  			data.html_safe
    	else
    		data = ""
  			data.html_safe
    	end
  	end
end
