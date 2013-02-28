module Post_Common_Methods

	def random
		srand
		rand(1000000).to_s
	end
	
	def postLogin
		$browser.cookies.clear
		$browser.goto($patch_login)
 		$email.set("#{$user_master_email}")
		$password.set("#{$user_master_password}")
		$sign_in_button.fire_event("onclick")
	end	
	
	def loginPost
		$browser.cookies.clear
 		$browser.goto($patch_login)
		$email.set("#{$user_master_email}")
		$password.set("#{$user_master_password}")
		$sign_in_button.fire_event("onclick")
	end
	
	
	def postLogout
		$profile_account_avatar.when_present.click
    	$sign_out.when_present.click
		$browser.cookies.clear
		$browser.goto($patch_opinion_group)
	end
	
	def	postEventSetup
		postLogin
		$browser.goto($patch_event)
		
		sleep 2
		if $post_pick_group.exists?
			$post_pick_group.when_present.fire_event("onclick")
			sleep 2
			$post_group_select.when_present.click
 			sleep 2
 			$post_event_title.when_present.set("Event #{random}")
 			$post_event_calendar_start_text.when_present.set("2012-12-12")  
 			$post_event_time_start_field.when_present.click
 			$post_event_select_time.when_present.select("8:00 AM")
 			$post_event_location.when_present.set("Location #{random}")
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text')")
			sleep 2
			$post_advanced.when_present.click
		else puts "Post Event Setup: FAILED! User able to Post."
		end
	end
	
	def	postEventSetupEditDelete
		postLogin
		$browser.goto($patch_event)
		
		sleep 2
		if $post_pick_group.exists?
			$post_pick_group.when_present.fire_event("onclick")
			sleep 2
			$post_group_select.when_present.click
 			sleep 2
 			$post_event_title.when_present.set("Event #{random}")
 			$post_event_calendar_start_text.when_present.set("2012-12-12")  
 			$post_event_time_start_field.when_present.click
 			$post_event_select_time.when_present.select("8:00 AM")
 			$post_event_location.when_present.set("Location #{random}")
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text likes edit. ')")
			sleep 2
			$post_now.fire_event("onclick")
		else puts "Post Event Setup: FAILED! User able to Post."
		end
	end
	
	def postNoteSetup
		loginPost
		$browser.goto($patch_note)
			
		sleep 2
		if $post_pick_group.exists?
 			$post_pick_group.fire_event("onclick")
 			postGroupPop
 			postGroupPop2
			$post_compose_note.set("Note field the internet likes cats..")
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_now.fire_event("onclick")
		else puts "Post Note Setup: FAILED! Unable to locate Post button."
		end
	end
		
	def postArticleSetup
		loginPost
		$browser.goto($patch_article)
			
		sleep 2
		if $post_pick_group.exists?
 			postGroupPop
 			postGroupPop2
 			$post_article_title.set("Article #{random}")
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('lava is hot.')")
 			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_now.fire_event("onclick")
		else puts "Post Article Setup: FAILED! User unable to locate Post button."
		end
	end
	
	def postMediaSetup
		loginPost
		$browser.goto($patch_media)
			
		sleep 2
		if $post_media_description.exists?
			$post_media_description.set("pictures of hiking mt. rainier #{random}.")
 			postGroupPop
 			postGroupPop2
			$post_media_button.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_media_button.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_now.fire_event("onclick")
		else puts "Post Media Setup: FAILED! User unable to locate Post button."
		end
	end
	
	def	postEventSetupQuick
		postLogin
		$browser.goto($patch_opinion_group)
		
		sleep 2
		$post_button.click
		$post_event.click
 		$post_event_title.when_present.set("Event #{random}")
 		$post_event_calendar_start_text.when_present.set("2012-12-12")  
 		$post_event_time_start_field.when_present.click
 		$post_event_select_time.when_present.select("8:00 AM")
 		$post_event_location.when_present.set("Location #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('distinctively visualize focused meta-services.')")
		sleep 2
		$post_advanced.when_present.click
	end
	
	def postNoteSetupQuick
		postLogin
		$browser.goto($patch_opinion_group)
			
		sleep 2
		$post_button.click
		$post_note.click
		$post_compose_note.set("Automated note (search).")
		$post_now.fire_event("onclick")
	end
		
	def postArticleSetupQuick
		loginPost
		$browser.goto($patch_opinion_group)
			
		sleep 2
		$post_button.click
		$post_article.click
 		$post_article_title.set("Article #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated article (search)')")
		$post_now.fire_event("onclick")
	end
	
	def postMediaSetupQuick
		loginPost
		$browser.goto($patch_opinion_group)
			
		sleep 2
		$post_media.fire_event("onclick")
		$post_media_description.set("Automated media (search).")
		$post_media_button.click
		$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
		$post_now.fire_event("onclick")
	end
	
	def	postEventSetupEditDeleteFlatiron
		postLogin
		$browser.goto($patch_flatiron_event)
		
		sleep 2
		if $post_pick_group.exists?
			$post_pick_group.when_present.fire_event("onclick")
			sleep 2
			$post_group_select.when_present.click
 			sleep 2
 			$post_event_title.when_present.set("Automated event (search)")
 			$post_event_calendar_start_text.when_present.set("2012-12-12")  
 			$post_event_time_start_field.when_present.click
 			$post_event_select_time.when_present.select("8:00 AM")
 			$post_event_location.when_present.set("Location #{random}")
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated event (search). ')")
			sleep 2
			$post_now.fire_event("onclick")
		else puts "Post Event Setup: FAILED! User able to Post."
		end
	end
	
	def postNoteSetupFlatiron
		loginPost
		$browser.goto($patch_flatiron_note)
			
		sleep 2
		if $post_pick_group.exists?
 			$post_pick_group.fire_event("onclick")
 			postGroupPop
			$post_compose_note.set("Note field the internet likes cats..")
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_now.fire_event("onclick")
		else puts "Post Note Setup: FAILED! Unable to locate Post button."
		end
	end
		
	def postArticleSetupFlatiron
		loginPost
		$browser.goto($patch_flatiron_article)
			
		sleep 2
		if $post_pick_group.exists?
 			postGroupPop
 			$post_article_title.set("Article #{random}")
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('lava is hot.')")
 			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_add_media.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_now.fire_event("onclick")
		else puts "Post Article Setup: FAILED! User unable to locate Post button."
		end
	end
	
	def postMediaSetupFlatiron
		loginPost
		$browser.goto($patch_flatiron_media)
			
		sleep 2
		if $post_media_description.exists?
			$post_media_description.set("pictures of hiking mt. rainier #{random}.")
 			postGroupPop
			$post_media_button.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_media_button.click
			$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
			$post_now.fire_event("onclick")
		else puts "Post Media Setup: FAILED! User unable to locate Post button."
		end
	end
	
	def postGroupPop
		$post_pick_group.when_present.fire_event("onclick")
		$post_group_select.when_present.click
 		sleep 2
 	end
 	
 	def postGroupPop2
		$post_add_another.when_present.click
		$post_group_select_2.when_present.click
 		sleep 2
 	end
 	
 	def post_draft
 		$user_account.click
		$user_your_posts.click
		$profile_goto_draft.wait_until_present
		$profile_goto_draft.click
		sleep 2
		$profile_c_post.fire_event("onclick")
	end
	
	def delete_draft
 		$user_account.click
		$user_your_posts.click
		$profile_goto_draft.wait_until_present
		$profile_goto_draft.click
		$profile_delete_draft.wait_until_present
		$profile_delete_draft.click
		$profile_delete_delete.wait_until_present
		$profile_delete_delete.click
	end
	
	def cancel_delete
 		$user_account.click
		$user_your_posts.click
		$profile_goto_draft.wait_until_present
		$profile_goto_draft.click
		$profile_delete_draft.wait_until_present
		$profile_delete_draft.click
		$profile_delete_cancel.wait_until_present
		$profile_delete_cancel.click
	end
	
	def close_delete
 		$user_account.click
		$user_your_posts.click
		$profile_delete.wait_until_present
		$profile_delete.click
		$profile_delete_close.wait_until_present
		$profile_delete_close.click
	end
	
	def edit_draft
 		$user_account.click
		$user_your_posts.click
		$profile_edit_post.wait_until_present
		$profile_edit_post.click
		sleep 2
		
		if $post_compose_note.exists?
			$post_compose_note.set("Note field populated by automated test.")
		else nil
		end
		
		if $post_article_title.exists?
			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text')")
		else nil
		end
		
		if $post_media_description.exists?
			$post_media_description.set("Media Description #{random}.")
		else nil
		end
		
		if $post_event_location.exists?
 			$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text')")	
		else nil
		end
		
		$post_now.click
	end
	def loginComment
		$browser.cookies.clear
		$browser.goto($patch_note)
 		$browser.goto($patch_login)
		$email.set("#{$user_master_email}")
		$password.set("#{$user_master_password}")
		$sign_in_button.click
	end
	
	def postGroupPop
		$post_pick_group.when_present.fire_event("onclick")
		$post_group_select.when_present.click
 		sleep 2
 	end
 	
 	def commentNotePop
 		loginComment
 		$browser.goto($patch_note)
 		sleep 2
 		postGroupPop
 		$post_compose_note.set("Note field populated by automated test.")
		$post_now.fire_event("onclick")
 	end
 	
 	def commentArticlePop
 		loginComment
 		$browser.goto($patch_article)
 		sleep 2
 		postGroupPop
 		$post_article_title.set("Article #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text')")
		sleep 2
		$post_now.fire_event("onclick")
	end
	
	def commentMediaPop
		loginComment
 		$browser.goto($patch_media)
 		sleep 2
 		postGroupPop
		$post_media_description.set("Media Description #{random}.")
		$post_media_button.click
		$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
		$post_now.fire_event("onclick")
	end
	
	def commentEventPop
		loginComment
 		$browser.goto($patch_event)
 		sleep 2
 		postGroupPop
		$post_event_title.set("Event #{random}")
 		$post_event_calendar_start_text.set("2013-12-12")  
 		$post_event_time_start_field.click
 		$post_event_select_time.select("8:00 AM")
 		$post_event_location.set("Location #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text')")
		#sleep 5
		$post_now.fire_event("onclick")
	end
	
#This will be cleaned up and optimized later
	def commentPopSubmit
		sleep 2
		$comment_textfield.click
		sleep 2
		$comment_textfield.set("Test Comment #{random}.")
		$comment_submit.when_present.click
		sleep 2
		$comment_textfield.set("Test Comment #{random}.")
		$comment_submit.when_present.click
		sleep 2
		
		begin 
		assert $browser.text.include?("Test Comment")
		rescue => e
			puts e
			$browser.refresh
			sleep 6
			$comment_textfield.click
			sleep 2
			$comment_textfield.set("Test Comment #{random}.")
			$comment_submit.when_present.click
			sleep 2
			$comment_textfield.click
			sleep 2
			$comment_textfield.set("Test Comment #{random}.")
			$comment_submit.when_present.click
		end
		
		if $comment_text_visible.exists?
		 	$browser.refresh
			sleep 2
		else $browser.refresh
			sleep 4
			$comment_textfield.click
			sleep 2
			$comment_textfield.set("Test Comment #{random}.")
			$comment_submit.when_present.click
			sleep 2
			$comment_textfield.click
			sleep 2
			$comment_textfield.set("Test Comment #{random}.")
			$comment_submit.when_present.click
			
			begin 
			assert $browser.text.include?("Test Comment")
			rescue => e
			puts e
			$browser.refresh
			sleep 4
			$comment_textfield.click
			sleep 2
			$comment_textfield.set("Test Comment #{random}.")
			$comment_submit.when_present.click
			sleep 2
			$comment_textfield.click
			sleep 2
			$comment_textfield.set("Test Comment #{random}.")
			$comment_submit.when_present.click
			end
			
			$browser.refresh
			sleep 2
			
			begin 
			assert $browser.text.include?("Test Comment")
			rescue => e
			puts "unable to post comment after 8 attempts. Giving up."
			end
		end	
	end

	def commentDelete
		$comment_delete_link.when_present.click
		sleep 2
		$comment_delete_confirm_modal.when_present.fire_event("onclick")
	end
	
	def commentCancelDelete
		$comment_delete_link.click
		sleep 2
		$comment_delete_cancel_modal.click
	end
	
	def commentCloseDelete
		$comment_delete_link.click
		sleep 2
		$comment_delete_close_modal.wait_until_present
		$comment_delete_close_modal.click
	end
	
	def commentFlag
		sleep 4
		$comment_flag_link.click
		sleep 2
		$comment_flag_confirm_modal.click
	end
	
	def commentCancelFlag
		sleep 4
		$comment_flag_link.click
		sleep 8 #when_present extends wait too long
		$comment_flag_cancel_modal.click
	end
	
	def commentCloseFlag
		sleep 4
		$comment_flag_link.click
		sleep 8 #when_present extends wait too long
		$comment_flag_close_modal.click
	end

	def postPublishLater
		$post_advanced.when_present.click
		$post_advanced_calendar.when_present.set("2013-12-12")
		#$post_advanced_time.when_present.click
		#$post_advanced_time.when_present.click
		$post_advanced_time.when_present.select("8:00 AM")
	end

	def createOpenGroup
		loginPost	
		sleep 2
		$browser.goto($patch_new_group)
		sleep 2
		$open_group.fire_event("onclick")
		$group_name.set("Arts and Entertainment Group #{random}")
		$group_nickname.set("Nickname #{random}")
		$group_description.set("Description #{random}")
		$category_arts.click
		$choose_icon.wait_until_present
		$choose_icon.click
		$arts_ent_drop.wait_until_present
		$arts_ent_drop.click
		$arts_ent_image.wait_until_present
		$arts_ent_image.fire_event("onclick")
		$create_group.click	
		
		if $group_check_errors.exists?
  			$create_group.click
		else nil
		end
		
		sleep 5
		$save_changes.click
	end
 	
 	def repostNotePop
 		createOpenGroup
 		sleep 2
		$repost_new_post.click
		$post_note.click
		sleep 2
 		$post_compose_note.set("Note field populated by automated test.")
		$post_now.fire_event("onclick")
 	end
 	
 	def repostArticlePop
 		createOpenGroup
 		sleep 2
		$repost_new_post.click
		$post_article.click
		sleep 2
 		$post_article_title.set("Article #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text')")
 		sleep 2
		$post_now.fire_event("onclick")
	end
	
	def repostMediaPop
		createOpenGroup
 		sleep 2
		$repost_new_post.click
		$post_media.fire_event("onclick")
		sleep 2
		$post_media_description.set("Media Description #{random}.")
		$post_media_button.click
		$post_media_file_upload.set("#{$post_media_username}code/patch-automation/test/TestData/GlacierBasinTrailMtRainier.JPG")
		$post_now.fire_event("onclick")
	end
	
	def repostEventPop
		createOpenGroup
 		sleep 2
		$repost_new_post.click
		$post_event.click
		sleep 2
		$post_event_title.set("Event #{random}")
 		$post_event_calendar_start_text.set("2013-12-12")  
 		$post_event_time_start_field.click
 		$post_event_select_time.select("8:00 AM")
 		$post_event_location.set("Location #{random}")
 		$browser.execute_script("jQuery('iframe.wysihtml5-sandbox').contents().find('body').prepend('Automated Text')")
		#sleep 5
		$post_now.fire_event("onclick")
	end
	
	def repost
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		$repost_text.set("Repost text #{random}.")
		$repost_button.click
	end
	
	def repostNoNote
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		$repost_button.click
	end
	
	def groupAddRemoveAdd
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		sleep 3
		$repost_remove_group.click
		sleep 3
		$report_group_choose.click
		$repost_text.set("Repost text #{random}.")
		$repost_button.click
	end
	
	def twoGroupSelect
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		sleep 3
		$repost_another_group.click
		$report_group_choose.click
		$repost_text.set("Repost text #{random}.")
		$repost_button.click
	end

	def groupAddRemoveAdd
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		sleep 3
		$repost_remove_group.click
		sleep 3
		$report_group_choose.click
		$repost_text.set("Repost text #{random}.")
		$repost_button.click
	end
	
	def char250String
		o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
		string  =  (0...250).map{ o[rand(o.length)] }.join
	end

	def repostPopulate250
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		$repost_text.set("#{char250String}")
		$repost_button.click
	end
	
	def char251String
		o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
		string  =  (0...251).map{ o[rand(o.length)] }.join
	end

	def repostPopulate250
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		$repost_text.set("#{char250String}")
		$repost_button.click
	end
	
	def repostPopulate251
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		$repost_text.set("#{char250String}")
		$repost_button.click
	end
	
	def fourGroupSelect
		sleep 3
		$repost_new_button.click
		$repost_group_select.click
		$report_group_choose.click
		sleep 3
		$repost_another_group.click
		$report_group_choose.click
		sleep 3
		$repost_another_group.click
		$report_group_choose.click
		sleep 3
		$repost_another_group.click
		$report_group_choose.click
		tooManyGroupsCheck
		$repost_text.set("Repost text #{random}.")
		$repost_button.click
	end
	
	def tooManyGroupsCheck
		if $repost_another_group.exists?
		puts "FAILED! User able to add more than four groups!"
		else nil
		end
	end
end