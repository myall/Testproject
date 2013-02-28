require 'watir/test'
require 'Users/user_variables'
require 'Utility/login_common'

include Login_Common_Methods

class TestJoinPageElement < UserVariables

##########
##Tests!##
##########

#Test 1: Sign up as a new User who receives Breaking News emails only
#Location: http://flatiron.#{$environment}.i.patch.com/signup

	def test_01BNChecked
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{random}@patch.com")
			$password.set("#{$user_master_password}")
			$breaking_news.set
			$daily_newsletter.clear
			$join_patch_button_right.click
		else puts "JS4T1: FAILED! Unable to locate join button!"
		end
		
		if $join_confirm_modal.exists?
			begin
				assert $join_confirm_modal.exists?
				rescue => e
				puts e
				puts "JS4T1: FAILED! Unable to join."
			end	
		else puts "JS4T1: FAILED! Unable to join."
		end
	end	

#Test 2: Sign up as a new User who receives Daily Newsletter emails only
#Location: http://flatiron.#{$environment}.i.patch.com/signup	
	def test_02DNChecked
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{random}@patch.com")
			$password.set("#{$user_master_password}")
			$breaking_news.clear
			$daily_newsletter.set
			$join_patch_button_right.click
		else puts "JS4T2: FAILED! Unable to locate join button!"
		end
		
		if $join_confirm_modal.exists?
			begin
				assert $join_confirm_modal.exists?
				rescue => e
				puts e
				puts "JS4T2: FAILED! Unable to join."
			end	
		else puts "JS4T2: FAILED! Unable to join."
		end
	end	

#Test 3: Sign up as a new User who receives Breaking News and Daily Newsletter emails
#Location: http://flatiron.#{$environment}.i.patch.com/signup
	def test_03BNAndDNChecked
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$email.set("User#{random}@patch.com")
			$password.set("#{$user_master_password}")
			$breaking_news.set
			$daily_newsletter.set
			$join_patch_button_right.click
		else puts "JS4T3: FAILED! Unable to locate join button!"
		end
		
		if $join_confirm_modal.exists?
			begin
				assert $join_confirm_modal.exists?
				rescue => e
				puts e
				puts "JS4T3: FAILED! Unable to join."
			end	
		else puts "JS4T3: FAILED! Unable to join."
		end
	end	
	
#Test 4: Sign up as a new User who receives no emails
#Location: http://flatiron.#{$environment}.i.patch.com/signup
	def test_04BNAndDNUnchecked
		$browser.cookies.clear
		$browser.goto($patch_login)
		if $fullname.exists?
			$fullname.set("User #{random}")
			$password.set("#{$user_master_password}")
			$breaking_news.clear
			$daily_newsletter.clear
			$join_patch_button_right.click
		else puts "JS4T4: FAILED! Unable to locate join button!"
		end
		
		if $join_confirm_modal.exists?
			begin
				assert $join_confirm_modal.exists?
				rescue => e
				puts e
				puts "JS4T4: FAILED! Unable to join."
			end	
		else puts "JS4T4: FAILED! Unable to join."
		end
	end	
end
