class VerificationsController < ApplicationController

	def create
	  current_user.verification_code =  rand(0000..9999).to_s.rjust(4, "0")
	  current_user.save

	  to = current_user.mobile_number
	  to = "+91"+to


	  @twilio_client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_TOKEN']
	  @twilio_client.account.sms.messages.create(
	    :from => ENV['TWILIO_PHONE_NUMBER'],
	    :to => to,
	    :body => "Your mrentz verification code is #{current_user.verification_code}. Happy renting !"
	  )
	  redirect_to verifications_path, :flash => { :success => "A verification code has been sent to your mobile. Please fill it in below." }
	  return
	end

	def verify
      if current_user.verification_code == params[:verification_code]
	      current_user.is_verified = true
	      current_user.verification_code = ''
	      current_user.save
	      redirect_to new_listing_path, :flash => { :success => "Thank you for verifying your mobile number. You can now rent your item." }
	      return
	    else
	      redirect_to verifications_path, :flash => { :errors => "Invalid verification code." }
	      return
	    end
	end

	def sendpin
	end

end
