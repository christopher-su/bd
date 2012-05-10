module ApplicationHelper
	
	# define the views's title
	def title
		base_title = "Professional 3D Architectural Rendering Services At Competitive Prices"   # title for default
		if @page_title.nil?			  # varible @page_title define each page's title
			base_title
		else
			"#{@page_title} | #{base_title}"
		end
	end

  # get all Category for header navi
  def cat_for_nav
    Category.all
  end

  
end
