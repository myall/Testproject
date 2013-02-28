module Login_Common_Methods

	def random
		srand
		rand(1000000).to_s
	end
	
	def bigrandom
		srand
		rand(1000000000000000000000000).to_s
	end
	
	def user_login_users
		$browser.cookies.clear
		$browser.goto($patch_login)
	end
	
	def fb_cleanup
		$browser.cookies.clear
		$browser.goto($facebook_home)
		fb_login
		$browser.goto($facebook_apps)
		sleep 2
		
			if $facebook_remove.exists?
				$facebook_remove.click
				$facebook_remove_modal.wait_until_present
				$facebook_remove_modal.click
			else nil
			end
			
		$facebook_dropdown.wait_until_present
		$facebook_dropdown.click
		$facebook_logout.wait_until_present
		$facebook_logout.click
	end	
	
	def fb_login
		if $facebook_email.exists?
			$facebook_email.set("tania.bhullar+juneqa@patch.com")
			$facebook_password.set("password123")		
			$facebook_log_in.click
		else nil
		end
	end
	
	def fb_allow
		$facebook_goto_app.wait_until_present
		$facebook_goto_app.click
		$facebook_allow.wait_until_present
		$facebook_allow.click
	end
end
