class PagesController < ApplicationController
	def help	
	end
	def term	
	end
	def privacypolicy
		set_meta_tags title: 'Privacy Policy', 
            description: "Mrentz Privacy Policy Page."
	end
	def about	
	end
	def contact	
	end
end