require 'watir/test'
require 'Users/user_variables'
require 'Utility/login_common'

include Login_Common_Methods

class TestForgotPageElement < UserVariables

####################
##Smoke Test File!##
#################### 

##########
##Tests!##
##########

#Test 1: Login using Facebook, not logged into Facebook, Patch app not approved
	def test01_fb_login_not_approved_TC_24862
		fb_cleanup
		$browser.goto($patch_login)
		$sign_in_facebook.wait_until_present
		$sign_in_facebook.click
		fb_login		
		fb_allow
		sleep 2
		
		begin 
		assert $logged_in_avatar.exists?
		rescue => e
			puts e
		puts "L2T1: FAILED! Unable to login via Facebook."
		end
		
		fb_cleanup
	end
	
#Test 2:  Login using Facebook, already logged into Facebook, Patch app not approved
	def test02_fb_login_existing_not_approved_TC_24862
		fb_cleanup
		$browser.goto($patch_login)
		$sign_in_facebook.wait_until_present
		$sign_in_facebook.click
		fb_login
		fb_allow
		sleep 2
		
		begin 
		assert $logged_in_avatar.exists?
		rescue => e
			puts e
		puts "L2T2: FAILED! Unable to login via Facebook."
		end
		
		fb_cleanup
	end

#Test 3: Login using Facebook, not logged into Facebook, Patch app approved
	def test03_fb_login_approved_TC_24862
		$browser.cookies.clear
		$browser.goto($patch_login)
		$sign_in_facebook.wait_until_present
		$sign_in_facebook.click
		fb_login		
		fb_allow
		$browser.goto($facebook_home)
		$facebook_dropdown.click
		$facebook_logout.click
		$browser.goto($patch_login)
		$sign_in_facebook.click
		fb_login
		sleep 2
		
		begin 
		assert $logged_in_avatar.exists?
		rescue => e
			puts e
		puts "L2T3: FAILED! Unable to login via Facebook."
		end
	end
	
#Test 4: Login using Facebook, already logged into Facebook, Patch app approved
	def test04_fb_login_existing_approved_TC_24862
		$browser.cookies.clear
		$browser.goto($facebook_home)
		fb_login
		$browser.goto($patch_login)
		$sign_in_facebook.click
		sleep 2
		
		begin 
		assert $logged_in_avatar.exists?
		rescue => e
			puts e
		puts "L2T4: FAILED! Unable to login via Facebook."
		end
	end

#Test 5: Valid Login
	def test05_ValidLogin_TC_24862
		$browser.cookies.clear
		$browser.goto($patch_login)
		$email.set("#{$user_master_email}")
		$password.set("#{$user_master_password}")
		$sign_in_button.click
		sleep 4
		
		begin 
			assert $logged_in_avatar.exists?
			rescue => e
			puts e
			puts "LS2T2: FAILED! User not logged in."
		end	
	end
end