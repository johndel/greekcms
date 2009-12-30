class PageSweeper < ActionController::Caching::Sweeper
	observe Page

	def after_save(page)
		expire_all_pages
	end
	
	def after_update(page)
		expire_all_pages
	end
	
	def after_destroy(page)
		expire_all_pages		
	end
# Έχει expire_all_pages και στο admin στο sorting των σελίδων	
end

	
	
	