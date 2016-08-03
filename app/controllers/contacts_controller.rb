class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash[:alert] = "Your message has been successfully submitted."
		else
			flash[:alert] = "Cannot send message."
			render :new
		end
	end

end
