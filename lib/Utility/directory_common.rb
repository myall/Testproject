module Common_Directory_Methods

	def random
		srand
		rand(1000000).to_s
	end
  
	def loginDirectory
		$browser.cookies.clear
		$browser.goto($patch_login)
		
		if $email.exists?
			$email.set("#{$user_master_email}")
			$password.set("#{$user_master_password}")
			$sign_in_button.click
			$browser.goto($patch_directory)
		else $browser.goto($patch_directory)
		end	
	end
	
	def postBasicReview
		$browser.goto($patch_directory_listing)
		$directory_review_begin.click
		$directory_review_text.set("Enjoyed my experience, I recommend times #{random}!!")
		$directory_review_post.fire_event("onclick")
	end
	
	def postGroupPop
	sleep 2
		$post_pick_group.when_present.fire_event("onclick")
		sleep 4
		$post_group_dropdown_review.select("Recently used groups")
 		sleep 2
 		$post_recent_group_select_review.click
 	end
	
	def createArticle
		sleep 5
		postGroupPop
 		$post_article_title.set("Article regarding Marge Elias Insurance #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('lava is hot.')")
 		$post_add_media.click
		$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
		$post_add_media.click
		$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
		sleep 4
		$post_now_review.fire_event("onclick")
	end
	
	def createArticleCancel
		sleep 5
		postGroupPop
 		$post_article_title.set("Article regarding Marge Elias Insurance #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('lava is hot.')")
 		$post_add_media.click
		$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
		$post_add_media.click
		$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
		sleep 4
		$post_review_cancel.click
	end
	
	def createEvent
		sleep 2
		if $post_pick_group.exists?
 			postGroupPop
 			$post_event_title.set("Marge Elias Insurance Signup Event #{random}")
 			$post_event_calendar_start_text.set("2013-12-12")  
 			$post_event_time_start_field.click
 			$post_event_select_time.select("8:00 AM")
 			$post_event_location.set("Location #{random}")
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Come find a plan that works for you!')")
 			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_now_review.click
			sleep 2
		else puts "Directory Review Article Post: FAILED! User able to Post."
		end	
	end
	
	def createEventCancel
		sleep 2
		if $post_pick_group.exists?
 			postGroupPop
 			$post_event_title.set("Marge Elias Insurance Signup Event #{random}")
 			$post_event_calendar_start_text.set("2013-12-12")  
 			$post_event_time_start_field.click
 			$post_event_select_time.select("8:00 AM")
 			$post_event_location.set("Location #{random}")
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Come find a plan that works for you!')")
 			sleep 2
 			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			sleep 2
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_review_cancel.click
			sleep 2
		else puts "Directory Review Article Post: FAILED! User able to Post."
		end	
	end
	
	def if_following_unfollow
		if $directory_review_follow_indicator.exists?
			$directory_review_follow.fire_event("onclick") 
		else nil
		end
	end
	
	def if_not_following_follow
		if $directory_review_no_follow_indicator.exists?
			$directory_review_follow.fire_event("onclick")
			$directory_group_follow_ok.fire_event("onclick")
		else nil
		end
	end
end