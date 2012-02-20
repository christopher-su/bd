module ApplicationHelper
	
	# define the views's title
	def title
		base_title = "BrosisDesign"   # title for default
		if @page_title.nil?			  # varible @page_title define each page's title
			base_title
		else
			"#{base_title} | #{@page_title}"
		end
	end
	
end
