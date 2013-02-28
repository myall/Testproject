require 'watir/test'
require 'Users/user_variables'
require 'Utility/login_common'

include Login_Common_Methods

class TestForgotPageElement < UserVariables

##########
##Tests!##
##########

#Test 1: Valid email password can be reset 
#Location: http://#{localpatch}.#{$environment}.i.patch.com/forgot_password
	def test01_ValidEmailReset
		$browser.cookies.clear
		$browser.goto($patch_forgot_password)
		if $forgot_password_email.exists?
			$forgot_password_email.set("#{$user_master_email}")
		else puts "FP1T1: FAILED! Unable to populate email field."
		end
		
		if $forgot_password_go.exists?
			$forgot_password_go.click
		else puts "FP1T1: FAILED! Unable to click login button."
		end		
				
		begin
		assert $forgot_password_success.exists?
		rescue => e
			puts e
		puts "FP1T1: FAILED! Password not reset."
		end
	end
		
#Test 2: Email not found password can be reset (?? Seems like it shouldn't_)
#Location: http://#{localpatch}.#{$environment}.i.patch.com/forgot_password
	def test02_EmailNotFoundReset
		$browser.cookies.clear
		$browser.goto($patch_forgot_password)
		if $forgot_password_email.exists?
			$forgot_password_email.set("NotRegistered@patch.com")
		else puts "FP1T2: FAILED! Unable to populate email field."
		end
		
		if $forgot_password_go.exists?
			$forgot_password_go.click
		else puts "FP1T2: FAILED! Unable to click Go button."
		end		
				
		begin
		assert $forgot_password_success.exists?
		rescue => e
			puts e
		puts "FP1T2: FAILED! Password not reset."
		end
	end

#Test 3: User may not reset an invalid email
#Location: http://#{localpatch}.#{$environment}.i.patch.com/forgot_password
	def test03_InvalidEmail
		$browser.cookies.clear
		$browser.goto($patch_forgot_password)
		if $forgot_password_email.exists?
			$forgot_password_email.set("Not an email address.")
		else puts "FP1T3: FAILED! Unable to populate email field."
		end
		
		if $forgot_password_go.exists?
			$forgot_password_go.click
		else puts "FP1T3: FAILED! Unable to click login button."
		end		
				
		begin
		assert $forgot_password.exists?
		rescue => e
			puts e
		puts "FP1T3: FAILED! Password reset."
		end
	end

#Test 4: Email field may not be blank
#Location: http://#{localpatch}.#{$environment}.i.patch.com/forgot_password
	def test04_BlankEmail
		$browser.cookies.clear
		$browser.goto($patch_forgot_password)
		sleep 5
		if $forgot_password_email.exists?
			$forgot_password_email.set("")
		else puts "FP1T4: FAILED! Unable to populate email field."
		end
		
		if $forgot_password_go.exists?
			$forgot_password_go.click
		else puts "FP1T4: FAILED! Unable to click login button."
		end		
				
		begin
		assert $forgot_password.exists?
		rescue => e
			puts e
		puts "FP1T4: FAILED! Password reset."
		end
	end

#Test 5: User may only reset a password 5 times
#Location: http://#{localpatch}.#{$environment}.i.patch.com/forgot_password
#	def test05_ResetNumberExceeded
#		$browser.goto($patch_forgot_password)
#		if $forgot_password.exists?
#			5.times do resetReload end 
#			puts "FP1T5: Password reset 5 times."
#		else puts "FP1T5: FAILED! Unable to populate email field."
#		end
		
#		if $forgot_password.exists?
#			puts "FP1T5: Password reset attempt."		
#		else puts "FP1T5: FAILED! Unable to populate email field."
#		end 
		
#		begin
#		assert $forgot_password.exists?
#			puts "FP1T5: Success. Password cannot be reset more than 5 times daily."
#		rescue => e
#			puts e
#		puts "FP1T5: FAILED! Password reset."
#		end
#	end
end

