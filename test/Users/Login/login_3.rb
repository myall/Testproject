require 'watir/test'
require 'Users/user_variables'
require 'Utility/login_common'

include Login_Common_Methods

class TestForgotPageElement < UserVariables

##########
##Tests!##
##########

#Test 1: User is unable to login because email and password fields are empty
#Location: http://#{localpatch}.#{$environment}.i.patch.com/login

	def test01_PasswordEmailMissing
		$browser.cookies.clear
		if $email.exists?
			$email.set("")
		else puts "LS3T1: FAILED! Unable to populate email field."
		end
		
		if $password.exists?
			$password.set("")
		else puts "LS3T1: FAILED! Unable to populate password field."
		end
		
		if $sign_in_button.exists?
			$sign_in_button.click
		else puts "LS3T1: FAILED! Unable to click login button."
		end
			
		begin
		assert $email.exists?
		rescue => e
			puts e
		puts "LS3T1: FAILED! User must remain on login page."
		end		
	end
	
#Test 2: Switch between Join and Login forms
#Location: http://#{localpatch}.#{$environment}.i.patch.com/login
#Location: http://#{localpatch}.#{$environment}.i.patch.com/signup

	def test_08SwitchJoinLogin
		$browser.cookies.clear
		if $join.exists?
			$join.fire_event("onclick")
		else puts "LS3T2: FAILED! Join link not found."
		end
		
		if $log_in_link.exists?
			$log_in_link.click
		else puts "LS3T2: FAILED! Sign in link not found."
		end
	end
end