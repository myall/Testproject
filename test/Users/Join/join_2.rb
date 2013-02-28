require 'watir/test'
require 'Users/user_variables'
require 'Utility/login_common'

include Login_Common_Methods

class TestJoinPageElement < UserVariables

##########
##Tests!##
##########

#Test 1: Email address without top level domain	

	def test_01InvalidJoinEmail
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{random}@patch")
			$password.set("#{$user_master_password}")
			$join_patch_button_right.click
		else puts "JS2T1: FAILED! Unable to locate join button!"
		end
		
		begin
			assert $join_error_please_check.exists?
			rescue => e
			puts e
			puts "JS2T1: FAILED! Please check for errors message not displayed!"
		end
		
		begin
			assert $join_error_email_invalid.exists?
			rescue => e
			puts e
			puts "JS2T1: FAILED! Must be a valid email address error message not displayed!"
		end
	end 
	
#Test 2: Email address without @ symbol	
	def test_02InvalidJoinEmailAtSign
		$browser.goto($patch_login)	
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{random}patch.com")
			$password.set("#{$user_master_password}")
			$join_patch_button_right.click
		else puts "JS2T1: FAILED! Unable to locate join button!"
		end
		
		begin
			assert $email.exists?
			rescue => e
			puts e
			puts "JS2T1: FAILED! Email address without @ symbol accepted."
		end	
	end
	
#Test 3: Email address already in use
	def test_03JoinEmailInUse
		$browser.goto($patch_login)	
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("#{$user_master_email}")
			$password.set("#{$user_master_password}")
			$join_patch_button_right.click 
		else puts "JS2T1: FAILED! Unable to locate join button!"
		end
		
		begin
			assert $join_error_email_in_use.exists?
			rescue => e
			puts e
			puts "JS2T1: FAILED! Email in use error message not displayed!"
		end	
	end	

#Test 4: Password too shore
#Location: http://flatiron.#{$environment}.i.patch.com/signup	
	def test_04PasswordTooShort
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{random}@patch.com")
			$password.set("p")
			$join_patch_button_right.click	
		else puts "JS2T2: FAILED! Unable to locate join button!"
		end
		
		begin
			assert $join_error_please_check.exists?
			rescue => e
			puts e
			puts "JS2T2: FAILED! Please check for errors message not displayed!"
		end
		
		begin
			assert $join_error_password_length.exists?
			rescue => e
			puts e
			puts "JS2T2: FAILED! Short password warning message not displayed!"
		end	
	end
end	
