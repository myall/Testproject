module Common_Group_Methods

	def random
		srand
		rand(1000000).to_s
	end

	def loginGroup
		$browser.cookies.clear
		$browser.goto($patch_login)
		
		if $email.exists?
			$email.set("#{$user_master_email}")
			$password.set("#{$user_master_password}")
			$sign_in_button.click
			$browser.goto($patch_new_group)
		else $browser.goto($patch_new_group)
		end	
	end
	
	def chooseExistingIcon
		$choose_icon.wait_until_present
		$choose_icon.click
		$arts_ent_drop.wait_until_present
		$arts_ent_drop.click
		$arts_ent_image.wait_until_present
		$arts_ent_image.fire_event("onclick")
  	end
  	
  	def groupSetAnyone
  		$group_anyone_setting.click
  		$group_anyone_setting.click
  	end
  	
  	def groupSetPrivate
  		$group_private_setting.click
  		$group_private_setting.click
  	end
  	
  	def checkIfIncorrectErrorDisplays
  		if $group_check_errors.exists?
  			$create_group.click
		else nil
		end
	end
end