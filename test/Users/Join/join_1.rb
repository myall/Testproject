require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'

class TestEditProfile < UserVariables

  	include Manage_Groups
    include Profile_Common
  
####################
##Smoke Test File!##
#################### 

##########
##Tests!##
##########

#Test 1: Validate placeholder text in name, email, and password fields
#Location: http://flatiron.#{$environment}.i.patch.com/signup

	def test_01validateNameField_TC_24384
		#rewrite
	end

#Test 2: Join successfully, validate modal confirmation dialog elements
#Location: http://flatiron.#{$environment}.i.patch.com/signup

	def test_02SuccessfulJoin_TC_24384
		#rewrite	
	end			

#Test 3: Empty name, email, or password field is not accepted 
#Location: http://flatiron.#{$environment}.i.patch.com/signup	
	
	def test_03EmptyNameField_TC_24384
		#rewrite
	end

#Test 4: Locate Terms of Use and Privacy Policy links, not active
#Location: http://flatiron.#{$environment}.i.patch.com/signup	
	def test_04TermsOfUse
		#rewrite
	end	

#Test 5: User clicks "Show me how" links on Post and Profile pages, verify redirect
	def test_05_1_show_me_how_TC_24406
		
		profileLogin
		$browser.goto($patch_note)
		$help_post_note.when_present.click
		sleep 4 
		$browser.window(:title, /Post a Note/).use do
		
		begin
		assert $browser.text.include?("Post a Note")
		rescue => e
			puts e
		puts "J1_T5.1: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_2_show_me_how_TC_24406
		$browser.goto($patch_note)
		$help_multiple_group_post.when_present.click
		sleep 4
		$browser.window(:title, /Post a Note/).use do
		
		begin
		assert $browser.text.include?("Post To Multiple Groups")
		rescue => e
			puts e
		puts "J1_T5.2: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_3_show_me_how_TC_24406
		$browser.goto($patch_note)
		$help_advanced_options.when_present.click
		sleep 4
		$browser.window(:title, /Post a Note/).use do
		
		begin
		assert $browser.text.include?("Advanced Options")
		rescue => e
			puts e
		puts "J1_T5.3: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_4_show_me_how_TC_24406
		$browser.goto($patch_note)
		$help_see_more.when_present.click
		sleep 4
		$browser.window(:title, /Patch Support/).use do
		
		begin
			assert $browser.text.include?("Frequently Asked Questions")
			rescue => e
				puts e
			puts "J1_T5.4: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
#Manage Profile
	def test_05_5_show_me_how_TC_24406
		profileLogin		
		navigate_to_profile
		$help_edit_profile.when_present.click
		sleep 4
		$browser.window(:title, /Edit Your Profile/).use do
		
		begin
		assert $browser.text.include?("Edit Your Profile")
		rescue => e
			puts e
			puts "J1_T5.5: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_6_show_me_how_TC_24406
		profileLogin		
		navigate_to_profile
		$help_edit_account.when_present.click
		sleep 4
		$browser.window(:title, //).use do
		
		begin
		assert $browser.text.include?("")
		rescue => e
			puts e
			puts "J1_T5.6: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_7_show_me_how_TC_24406
		profileLogin		
		navigate_to_profile
		$help_change_password.when_present.click
		sleep 4
		$browser.window(:title, /Edit Your Password/).use do
		
		begin
		assert $browser.text.include?("Edit Your Password and Account Details")
		rescue => e
			puts e
			puts "J1_T5.7: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_8_show_me_how_TC_24406
		profileLogin		
		navigate_to_profile
		$help_about_updates.when_present.click
		sleep 4
		$browser.window(:title, /Edit Your Newsletter/).use do
		
		begin
		assert $browser.text.include?("Edit Email Updates")
		rescue => e
			puts e
			puts "J1_T5.8: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_9_show_me_how_TC_24406
		profileLogin		
		navigate_to_profile
		$help_email_settings.when_present.click
		sleep 4
		$browser.window(:title, /Edit Your Newsletter/).use do
		
		begin
		assert $browser.text.include?("Email Settings")
		rescue => e
			puts e
			puts "J1_T5.9: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_10_show_me_how_TC_24406
		profileLogin		
		navigate_to_profile
		$help_about_posts.when_present.click
		sleep 4
		$browser.window(:title, /Edit Your Saved Drafts/).use do
		
		begin
		assert $browser.text.include?("Edit Your Saved Drafts")
		rescue => e
			puts e
			puts "J1_T5.10: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_11_show_me_how_TC_24406
		profileLogin		
		navigate_to_profile
		$help_manage_groups.when_present.click
		sleep 4
		$browser.window(:title, /Manage Groups/).use do
		
		begin
		assert $browser.text.include?("Manage Groups You Follow")
		rescue => e
			puts e
		puts "J1_T5.11: FAILED! User unable to navigate to zendesk."
		end
		end
	end

#Groups 
	def test_05_12_show_me_how_TC_24406
		profileLogin
		$browser.goto($patch_mongooses_settings)
		$help_edit_group_type.when_present.click
		sleep 4
		$browser.window(:title, /Manage Your Group/).use do
		
		begin
		assert $browser.text.include?("Edit Group Icon")
		rescue => e
			puts e
		puts "J1_T5.12: FAILED! User unable to navigate to zendesk."
		end
		end
	end  
	
	def test_05_13_show_me_how_TC_24406
		profileLogin
		$browser.goto($patch_mongooses_settings)
		$help_edit_group_type.when_present.click
		sleep 4
		$browser.window(:title, /Manage Your Group/).use do
		
		begin
		assert $browser.text.include?("Edit Group Type")
		rescue => e
			puts e
		puts "J1_T5.13: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_14_show_me_how_TC_24406
		profileLogin
		$browser.goto($patch_mongooses_settings)
		$help_manage_roles.when_present.click
		sleep 4
		$browser.window(:title, /Manage Your Group/).use do
		
		begin
		assert $browser.text.include?("Manage Roles and Followers")
		rescue => e
			puts e
		puts "J1_T5.14: FAILED! User unable to navigate to zendesk."
		end
		end
	end
	
	def test_05_15_show_me_how_TC_24406
		profileLogin
		$browser.goto($patch_mongooses_settings)
		$help_invite_people.when_present.click
		sleep 4
		$browser.window(:title, /Manage Your Group/).use do
		
		begin
		assert $browser.text.include?("Invite People")
		rescue => e
			puts e
		puts "J1_T5.15: FAILED! User unable to navigate to zendesk."
		end
		end
	end
end	
