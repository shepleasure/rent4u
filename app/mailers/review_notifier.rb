class ReviewNotifier < ApplicationMailer

	default :from => 'Rent4U'

	  # send a signup email to the user, pass in the user object that   contains the user's email address
	  def send_review_email(user, review_user, listing)
	    @user = user
	    @review_user = review_user
	    @listing_title = listing


	    mail( :to => @user.email,
	    :subject => 'You have a New Notification' )
	  end

end
