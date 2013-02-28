require 'watir/test'
require 'Users/user_variables'
require 'Utility/login_common'

include Login_Common_Methods

class TestForgotPageElement < UserVariables

##########
##Tests!##
##########

#Test 1: Invalid email error message displays
#Location: http://#{localpatch}.#{$environment}.i.patch.com/login
	
	def test01_InvalidEmail
		$browser.cookies.clear
		if $email.exists?
			$email.set("This isn't an email address.")
		else puts "LS1T1: FAILED! Unable to populate email field."
		end
		
		if $password.exists?
			$password.set("#{$user_master_password}")
		else puts "LS1T1: FAILED! Unable to populate password field."
		end
		
		if $sign_in_button.exists?
			$sign_in_button.click
		else puts "LS1T1: FAILED! Unable to click login button."
		end		
		
		begin
		assert $email.exists?
		rescue => e
			puts e
		puts "LS1T1: FAILED! User must remain on login page."
		end		
	end
			
#Test 2: Email address not found error message displays
#Location: http://#{localpatch}.#{$environment}.i.patch.com/login
	def test02_EmailNotFound
		$browser.cookies.clear	
		if $email.exists?
			$email.set("invalid@patch.com")
		else puts "LS1T2: FAILED! Unable to populate email field."
		end

		if $password.exists?
			$password.set("#{$user_master_password}")
		else puts "LS1T2: FAILED! Unable to populate password field."
		end	
		
		if $sign_in_button.exists?
			$sign_in_button.click
		else puts "LS1T2: FAILED! Unable to click login button."
		end		
				
		begin
		assert $user_not_found_error.exists?
		rescue => e
			puts e
		puts "LS1T2: FAILED! Error message not displayed."
		end		
	end
			
#Test 3: Incorrect Password error message displays
#Location: http://#{localpatch}.#{$environment}.i.patch.com/login
	def test03_IncorrectPassword
		$browser.cookies.clear
		if $email.exists?
			$email.set("#{$user_master_email}")
		else puts "LS1T3: FAILED! Unable to populate email field."
		end

		if $password.exists?
			$password.set("wrongpassword")
		else puts "LS1T3: FAILED! Unable to populate password field."
		end
		
		if $sign_in_button.exists?
			$sign_in_button.click
		else puts "LS1T3: FAILED! Unable to click login button."
		end	 
				
		begin
		assert $password_error_invalid.exists?
		rescue => e
			puts e
		puts "LS1T3: FAILED! Error message not displayed."
		end		
	end

#Test 4: User unable to login because email field is empty
#Location: http://#{localpatch}.#{$environment}.i.patch.com/login
	def test04_EmailMissing
		$browser.cookies.clear
		if $email.exists?
			$email.set("")
		else puts "LS1T4: FAILED! Unable to populate email field."
		end
		
		if $password.exists?
			$password.set("#{$user_master_password}")
		else puts "LS1T4: FAILED! Unable to populate password field."
		end
		
		if $sign_in_button.exists?
			$sign_in_button.click
		else puts "LS1T4: FAILED! Unable to click login button."
		end
		
		begin
		assert $email.exists?
		rescue => e
			puts e
		puts "LS1T4: FAILED! User must remain on login page."
		end
	end

#Test 5: User unable to login because password field is empty
#Location: http://#{localpatch}.#{$environment}.i.patch.com/login

	def test05_PasswordMissing
		$browser.cookies.clear
		if $email.exists?
			$email.set("#{$user_master_email}")
		else puts "LS1T5: FAILED! Unable to populate email field."
		end
		
		if $password.exists?
			$password.set("")
		else puts "LS1T5: FAILED! Unable to populate password field."
		end
		
		if $sign_in_button.exists?
			$sign_in_button.click
		else puts "LS1T5: FAILED! Unable to click login button."
		end
			
		begin
		assert $email.exists?
		rescue => e
			puts e
		puts "LS1T5: FAILED! User must remain on login page."
		end		
	end
end
