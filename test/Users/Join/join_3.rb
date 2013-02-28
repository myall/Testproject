require 'watir/test'
require 'Users/user_variables'
require 'Utility/login_common'

include Login_Common_Methods

class TestJoinPageElement < UserVariables

##########
##Tests!##
##########

#Test 1: Verify User is able to enter a long name
#Location: http://flatiron.#{$environment}.i.patch.com/signup

	def test_01LongName
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{bigrandom}")
			$email.set("User#{random}@patch.com")
			$password.set("#{$user_master_password}")
			$join_patch_button_right.click
		else puts "JS3T1: FAILED! Unable to locate join button!"
		end
		
		if $join_confirm_modal.exists?
			$close_dialog_x.click
		else puts "JS3T1: FAILED! Unable to add a User with a long name."
		end
	end	

#Test 2: Verify User is able to enter a long email
#Location: http://flatiron.#{$environment}.i.patch.com/signup	
	
	def test_02LongEmail
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{bigrandom}@patch.com")
			$password.set("#{$user_master_password}")
			$join_patch_button_right.click
		else puts "JS3T2: FAILED! Unable to locate join button!"
		end
		
		if $join_confirm_modal.exists?
			$close_dialog_x.click
		else puts "JS3T2: FAILED! Unable to add a User with a long name."
		end
	end	
	
#Test 3: Verify User is able to enter a long password
#Location: http://flatiron.#{$environment}.i.patch.com/signup	
	
	def test_03LongPassword
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{random}@patch.com")
			$password.set("password#{bigrandom}")
			$join_patch_button_right.click
		else puts "JS3T3: FAILED! Unable to locate join button!"
		end
		
		if $join_confirm_modal.exists?
			$close_dialog_x.click
		else puts "JS3T3: FAILED! Unable to add a User with a long name."
		end
	end		
end	
	
	
	
	
	
	
	
	
	
	
	
	
