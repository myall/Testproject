require 'watir/test'

##########################################	
##Don't forget! Set the environments!   ##
##The #{$environment} and #{$local_patch}##
##variables can be found in             ##
##lib\watir	est.rb in the WatirTest    ##
##class, approximately line 64!	        ##
##########################################

class UserVariables < WatirTest
  def setup
    super
    $browser = driver
    $patch = "http://#{$local_patch}#{$environment}.patch.com"
    $patch_login = "http://#{$local_patch}#{$environment}.patch.com/login"
    $patch_join = "http://#{$local_patch}#{$environment}.patch.com/signup"
    $patch_forgot_password = "http://#{$local_patch}#{$environment}.patch.com/forgot_password"
    $facebook_home = "http://www.facebook.com/"
    $facebook_apps = "http://www.facebook.com/settings?tab=applications"
    $patch_note = "http://#{$local_patch}#{$environment}.patch.com/posts/note/new"
    $patch_group = "http://#{$local_patch}#{$environment}.patch.com/groups"
    $patch_users = "http://#{$local_patch}#{$environment}.patch.com/users"
    $patch_logout = "http://#{$local_patch}#{$environment}.patch.com/logout"
    $patch_mongooses_settings = "http://#{$flatiron_patch}#{$environment}.patch.com/groups/the-fighting-mongooses/edit/basic_information"
    
#########################	
##set the environment!!##	
#########################

#########################################
##http://#{$local_patch}#{$environment}.patch.com/login##
#########################################

#Login page (left partition) 
    $join_patch_button_left = $browser.link(:class, /btn-success/)

#Login page (right partition)
#$signIn = $browser.button(:id, /signin/)
    $log_in_link = $browser.link(:text, /Sign in/)
    $join = $browser.link(:text, /Join now/)
    $email = $browser.text_field(:name, /email/)
    $email_placeholder = $browser.text_field(:placeholder, /email@website.com/)
    $sign_in_button = $browser.button(:id, /signin/)
    $password = $browser.text_field(:name, /password/)
    $join_patch_button_right = $browser.link(:href, /signup/)
    $sign_in_facebook = $browser.link(:class, /btn btn-facebook input-medium pull-left/)
    $remember_me = $browser.checkbox(:id, /persistent_1/)
    $forgot_password = $browser.link(:href, /forgot_password/)

#Login page error messages
    $email_error_invalid = $browser.div(:text, /Must be a valid email address/)
    $email_error_no_record = $browser.div(:text, /Password incorrect/)
#	$email_error_empty = cannot be checked. browser check, not js event.
    $password_error_invalid = $browser.div(:text, /Password incorrect/)
#	$password_error_empty = cannot be checked. browser check, not js event.
    $user_not_found_error = $browser.div(:text, /User not found/)
    $login_error_check = $browser.div(:text, /Please check for errors/)

#After Login Modal
    $welcome_to_the_new_patch_dialog = $browser.button(:class, /close_modal/)
    $close_tour_dialog = $browser.link(:text, /Close tour/)

###################################################
##http://#{$local_patch}#{$environment}.patch.com/forgot_password##
###################################################

#Forgot Password page
    $forgot_password_email = $browser.text_field(:name, /email/)
    $forgot_password_go = $browser.button(:class, /success/)
    $forgot_password_success = $browser.div(:text, /that will enable you to reset your password/)

##########################################
##http://#{$local_patch}#{$environment}.patch.com/signup##
##########################################

#Join page (left partition) 
    $join_patch_button_left = $browser.link(:class, /btn-success/)

#Join page (right partition)
    $sign_in = $browser.link(:class, /login/)
    $fullname = $browser.text_field(:name, /name/)
    $fullname_placeholder = $browser.text_field(:placeholder, /your username/)
    $email = $browser.text_field(:name, /email/)
    $email_placeholder = $browser.text_field(:placeholder, /username@website.com/)
    $password = $browser.text_field(:name, /password/)
    $password_placeholder = $browser.text_field(:placeholder, /password/)
    $breaking_news = $browser.checkbox(:id, /Breaking/)
    $daily_newsletter = $browser.checkbox(:id, /Daily/)
    $terms_of_use = $browser.link(:text, /Terms of Use/)
    $privacy_policy = $browser.link(:text, /Privacy Policy/)
    $join_patch_button_right = $browser.button(:text, /Join Patch/)
    $sign_in_facebook = $browser.link(:href, /authorize/)

#Join page error messages
    $join_error_please_check = $browser.div(:text, /Please check for errors/)
    $join_error_email_invalid = $browser.p(:text, /Must be a valid email address/)
    $join_error_email_in_use = $browser.div(:text, /email address already in use/)
    $join_error_password_length = $browser.div(:text, /Must at least 7 characters/)

#Join Confirmation Modal Dialog
    $join_confirm_modal = $browser.div(:id, /myModal/)
    $please_check_text = $browser.div(:id, /myModal/).span(:text, /Please check your email/)
    $envelope_image = $browser.div(:id, /myModal/).image(:src, /mailbox/)
    $next_steps_text =  $browser.div(:id, /myModal/).span(:text, /We've just sent you a link to confirm your address. When you click that link, you will be registered and able to post your own stuff and create your own groups./)
    $resend_link = $browser.div(:id, /myModal/).link(:href, /confirmation_email/)
    $close_dialog_x = $browser.div(:id, /myModal/).button(:type, /button/)

##########################
##Show me how help links##
##########################
#Post
	$help_post_note = $browser.link(:href, /22491747/)
	$help_multiple_group_post = $browser.link(:href, /22491747#2/)
	$help_advanced_options = $browser.link(:href, /22491747#1/)
	$help_see_more = $browser.link(:href, /forums/) #same for profile and groups
	
#Profile
	$help_edit_profile = $browser.link(:href, /22491637/)
	$help_edit_account = $browser.link(:href, /22472011/)
	$help_change_password = $browser.link(:href, /22472011#1/)
	$help_about_updates = $browser.link(:href, /22491813#2/)
	$help_email_settings = $browser.link(:href, /22491813#1/)
	$help_about_posts = $browser.link(:href, /22493786/)
	$help_manage_groups = $browser.link(:href, /22491783/)
	
#Groups
	$help_edit_group_icon = $browser.link(:href, /22503628#2/)
	$help_edit_group_type = $browser.link(:href, /22503628#4/)
	$help_manage_roles = $browser.link(:href, /22503628#3/)
	$help_invite_people = $browser.link(:href, /22503628#1/)
	
############################################################################
##http://#{$local_patch}#{$environment}.patch.com/users/mellissa-mcconnell##
############################################################################

#View Profile Page
    $profile_edit_link = $browser.div(:id, /edit-profile/).link(:href, /edit/)
    $profile_manager_link = $browser.div(:id => /groups/, :class => /bottom/).link(:href, /group/)
    $profile_unfollow_group = $browser.div(:id => /groups/, :class => /bottom/).button(:type, /submit/) #same as follow button
    $profile_follow_group = $browser.div(:id => /groups/, :class => /bottom/).button(:type, /submit/)
    $profile_group_icon = $browser.div(:class, /avatar-mid/)
    $profile_activity_profile = #unique id needed
    $profile_activity_group = #unique id needed
    $profile_show_more = $browser.link(:text, /Show More/)
    $profile_following_close = $browser.div(:id, /global_modal/).div(:class, /modal_confirm/).button(:class, /close/)
    $profile_following_account = $browser.div(:class, /modal_confirm/).div(:class, /footer/).link(:href, /users/)
    $profile_following_ok = $browser.div(:class, /modal_confirm/).div(:class, /footer/).link(:class, /success/)
    $group_for_guest_user = $browser.link(:href => /users/)
    $short_version_user_bio = $browser.div(:class=> "footroom", :text => /I am a/)
    $little_more_about_me = $browser.div(:class=> "active footroom", :text => /little more about me/)
    $profile_picture_view = $browser.div(:class => /sidebar/)

#Edit Profile
    $profile_account_avatar = $browser.img(:id, /header-avatar/)
    $your_profile = $browser.a(:text, /Your Profile/)
    $profile_edit_button = $browser.a(:href => /edit/, :class => /btn-success/)

#Edit Profile Details
    $profile_account = $browser.span(:text, /Account/)
    $profile_picture = $browser.link(:id, /avatar_upload/)
    $profile_name = $browser.text_field(:name, /name/)
    $profile_choose_a_file = $browser.link(:id, /avatar_upload/)
    $profile_gender = $browser.select_list(:name, /gender/)
    $profile_home_patch = $browser.select_list(:name, /hometown/)
    $profile_resident_mm = $browser.select_list(:name, /month/)
    $profile_resident_dd = $browser.select_list(:name, /day/)
    $profile_resident_yy = $browser.select_list(:name, /year/)
    $profile_i_am_a = $browser.text_field(:name, /tagline/)
    $profile_more_about = $browser.text_field(:name, "bio")
    $profile_community = $browser.text_field(:name, "favorite")
    $profile_cancel = $browser.link(:class, /close-cancel/) #same across all profile pages
    $profile_save_changes = $browser.button(:id, /save/) #same across all profile pages
    $save_changes_profile_pic = $browser.button(:text, /Save/)
    $image_crop = $browser.div(:class, /jcrop-tracker/)
    $preview_label = $browser.div(:class, /preview_label/)
    $close_photo_upload_dialog = $browser.button(:class, /close/)

#Personal Information
    $profile_email = $browser.text_field(:id, /contact_email/)
    $profile_phone = $browser.text_field(:id, /contact_phone/)
    $profile_password = $browser.text_field(:id, /password/)
    $profile_cancel = $browser.link(:class, /close-cancel/) #same across all profile pages
    $invalid_email_error = $browser.p(:text, /Must be a valid email/)
    $password_prompt_message = $browser.p(:text, /Enter your password before you can continue with your update/)

#Change Password
    $profile_old_pass = $browser.text_field(:name, /old_password/)
    $profile_new_pass = $browser.text_field(:name, /new_password/)
    $profile_confirm_pass = $browser.text_field(:name, /confirm_password/)
    $profile_cancel = $browser.link(:class, /close-cancel/) #same across all profile pages
    $profile_no_match_pass = $browser.span(:text, /Please make sure that your passwords match./)
    $profile_incorrect_pass = $browser.div(:text, /Password incorrect/)
    $profile_check_err_pass = $browser.div(:text, /Please check for errors/)
    $profile_invalid_pass = $browser.p(:text, /Must be at least 7 characters/) #error message incorrect, JIRA #3211
    $password_changed_successfully = $browser.div(:text => /Password changed successfully/)

#Updates

#Your Posts
    $profile_current = $browser.link(:href, /drafts/)
    $profile_edit_post =  $browser.link(:text, "Edit") #fire_event, same across post pages
    $profile_post_now = $browser.button(:text => "Post Now", :index => 1)
    $profile_delete = $browser.element(:xpath, "//div[@id='draft_preview_btns']//a[@href='#delete_draft_modal']")
    $profile_new_draft = $browser.element(:xpath, "//ul[@id='new_drafts_wraper']/li[1]/a")
    $profile_published_post = $browser.element(:xpath, "//ul[@id='published_drafts_wrapper']/li[1]/a")
    $delete_post_button = $browser.link(:href => /delete_post_modal/)
    $profile_delete_on_scheduled_post = $browser.element(:xpath, "//div[@id='scheduled_drafts']/section[1]//a[text()='Delete'][1]")
    $profile_delete_close = $browser.div(:id, /delete_draft/).button(:class, /close/) #same across post pages
    $profile_delete_cancel = $browser.div(:id, /delete_draft/).button(:class, /cancel/) #same across post pages
    $profile_delete_delete = $browser.div(:id, /delete_draft/).button(:id, /delete/) #same across post pages
    $profile_scheduled = $browser.link(:href, /scheduled/)
    $profile_edit_post =  $browser.link(:text, "Edit") #fire_event, same across post pages
    $profile_published = $browser.link(:href, /published/)
    $profile_p_gicon = $browser.link(:class, /group_avatar/).img(:src, //)
    #$profile_p_group = $browser.div(:class, /post-credit/).link(:href, /groups/)
    $profile_p_group = $browser.strong(:class => /group_name/).link(:text => //)
    #$proflie_p_user = $browser.div(:class, /post-credit/).link(:href, /users/)
    $proflie_p_user = $browser.strong(:class => /author_name/).link(:text => //)
    $profile_p_article = $browser.div(:class, /bd note/).link(:text => //)
    $profile_p_calendar = $browser.div(:class, /event-info/).link(:href, /calendar/) #event_only
    $profile_p_map = $browser.link(:text, /See Map/) #event only
    $count_of_submitted_drafts = $browser.element(:xpath => "//a[@href= '#submitted_drafts']/span[@class='js-count']")
    $count_of_drafts = $browser.element(:xpath => "//a[@href= '#new_drafts']/span[@class='js-count']")
    $count_of_scheduled = $browser.element(:xpath => "//a[@href= '#scheduled_drafts']/span[@class='js-count']")
    $count_of_published = $browser.element(:xpath => "//a[@href= '#published_drafts']/span[@class='js-count']")
    $time_stamp_on_published_post = $browser.time(:text => /ago/)
    $repost_link_on_post = $browser.link(:text => /Repost/)
    $repost_button_on_post = $browser.button(:text => /Repost/)
    $comment_link = $browser.link(:text => /Comment/)
    $comment_button = $browser.link(:href => /new_comment/, :class => /btn-with-icon/)
    $edit_this_post = $browser.link(:text => /Edit this Post/)
    $delete_this_post = $browser.link(:text => /Delete this Post/)
    $delete_on_delete_this_post = $browser.button(:id => /draft_delete/, :text => /Delete/)
    $delete_on_delete_this_draft = $browser.button(:id => /draft_delete/, :text => /Delete/)
    $post_successfully_deleted = $browser.div(:class => /flash_text/, :text => /The post was successfully deleted/)

#Email Settings
    $profile_daily = $browser.checkbox(:name, /newsletter/)
    $profile_comments = $browser.checkbox(:name, /commentPreferences/)
    $profile_post_comment = $browser.checkbox(:value, /CommentOnPost/)
    $profile_reposted = $browser.checkbox(:value, /Repost/)
    $profile_group_invite = $browser.checkbox(:value, /InvitationJoinGroup/)
    $profile_group_manager = $browser.checkbox(:value, /GroupAccessModerator/)
    $profile_group_contribute = $browser.checkbox(:value, /GroupAccessContributor/)
    $profile_group_follower = $browser.checkbox(:value, /PrivateGroup/)
    $profile_follows = $browser.checkbox(:value, /NotificationForModerator/)
    $profile_posts = $browser.checkbox(:value, /PostForModerator/)
    $profile_request = $browser.checkbox(:value, /RequestFollow/)
    $profile_preferences = $browser.select_list(:name, /frequency/)
    $group_name_link = $browser.link(:text => /Schools/, :index => 1)
    $group_icon = $browser.div(:class => /pull-left avatar avatar-mid/).link(:href => /editors-pic/).img(:src => //)
    $more_link = $browser.link(:text => /More/)

#Manage Groups
    $profile_group_i = $browser.link(:class, /avatar-mid/)
    $profile_group_email = $browser.link(:text, /Email Settings/)
    $email_settings_manage_group = $browser.element(:xpath => "//ul[@id='groupsSortable']//a[contains(text(), 'Email Settings')]")
    $profile_manage_group_follow = $browser.button(:class, /group-follow/) #same as follow
    $profile_manage_group_unfollow = $browser.button(:class, /group-follow/) #same as follow
    $profile_following_close = $browser.div(:id, /global_modal/).div(:class, /modal_confirm/).button(:class, /close/) #same as view profile
    $profile_following_account = $browser.div(:class, /modal_confirm/).div(:class, /footer/).link(:href, /users/) #same as view profile
    $profile_following_ok = $browser.div(:class, /modal_confirm/).div(:class, /footer/).link(:class, /success/) #same as view profile
    $profile_dragdrop = $browser.link(:class, /btn dragger/)
    $group_icon_on_manage_group = $browser.element(:xpath => "//ul[@id='groupsSortable']//a/img")

#Create Group
    $patch_new_group = "http://#{$local_patch}#{$environment}.patch.com/groups/new"
    $open_group = $browser.img(:alt, /Open Group/)
    $group_name = $browser.text_field(:index, 1)
    $group_nickname = $browser.text_field(:index, 2)
    $group_description = $browser.text_field(:index, 2)
    $category_business = $browser.span(:text, "Business")
    $category_education = $browser.span(:text, "Education")
    $category_family = $browser.span(:class => /content/, :text => /News/)
    $create_group = $browser.button(:id, /create_group/)
    $choose_icon = $browser.element(:xpath, "//div[@id='icon_carousel']/div[1]/div[1]/div[1]/div/img")
    $skip_button = $browser.link(:text, /Skip/)
    $check_for_error = $browser.div(:text, /Please check for errors/)

#Profile Links Sidebar
    $view_profile = $browser.link(:text, /View Profile/)
    $profile_edit = $browser.link(:text, /Edit Profile/)
    $profile_personal = $browser.link(:text, /Personal Info/)
    $profile_change_pass = $browser.link(:text, /Change Password/)
    $profile_updates = $browser.link(:text, /Updates/)
    $profile_updates_side_link = $browser.element(:xpath, "//ul[@id='userNav']/li/a[text()='Updates']")
    $profile_your_posts = $browser.link(:text, /Your Posts/)
    $profile_email_settings = $browser.link(:text, /Email Settings/)
    $profile_manage_groups = $browser.link(:text, /Manage Groups/)

#Create Post
    $post_pick_group = $browser.div(:class, /post-bucket controls/).button(:text, /Choose/)
    $group_select = $browser.select_list(:name, /group-chooser-select/)
    $post_compose_note = $browser.text_field(:id, /post_short/)
    $post_now = $browser.button(:text => /Post Now/)
    $post_now_caret = $browser.button(:id => /post_dropdown/).span(:class, /caret/)
    $profile_you_have_got_updates = $browser.link(:text => /Updates/)
    $profile_notification_num = $browser.span(:class => /notification-num/)
    $see_all_updates = $browser.link(:text, /See all updates/)
    $save_as_draft = $browser.link(:text, /Save as draft/)
    $draft_saved_message = $browser.div(:class, /alert-post-message/)
    $advanced_options = $browser.link(:text, /Advanced Options/)
    $post_advanced_calendar = $browser.text_field(:name, /publish_at/)
    $post_advanced_time_drop_down = $browser.div(:id, /advanced_options/).span(:class, /dropdown/)
    $post_advanced_time = $browser.select_list(:name, /publish_at.time/) #.select("8:00 AM")
    $profile_pic_upload = $browser.file_field(:id, //)

#Share Review
    $reliable_group = $browser.link(:text, /Reliable Group/)
    $share_review_text_field = $browser.span(:text,/Share a review of this business/)
    $leave_comment_textfield = $browser.text_field(:id => /comment_body/)
    $leave_comment_link = $browser.link(:text => /Leave a comment/)
    $leave_comment_link2 = $browser.link(:text => /Leave a comment/)
    #$repost_link = $browser.link(:text => /repost/)
    $repost_link = $browser.link(:text => /Repost/)
    $repost_button = $browser.button(:text=> /Repost/, :id=> /post_submit/)

#Review Post
    $post_compose_review = $browser.text_field(:id, /post_body/)

#Follow a Group
    $follow_group = $browser.button(:type=> /submit/, :class => /group-follow/)
    $follow_success_text = $browser.span(:class => /large-theme-header/, :text => /Great/)
    $follow_success_ok_button = $browser.link(:text => /OK/)
    $directory_review_follow_indicator = $browser.button(:class, "btn btn-with-icon group-follow following")
    $directory_review_follow = $browser.button(:class, /group-follow/) #fire_event("onclick")
    $follow_a_group = $browser.button(:text, /Follow/)
    $invite_to_group = $browser.link(:href, /invite_friends/)
    $invite_email = $browser.link(:href, /#email/)
    $contacts_email =$browser.text_field(:name, /manualEmails/)
    $invite_people = $browser.button(:id => /post_submit/)
    $invite_success = $browser.link(:text => /Ok/)
    $group_settings = $browser.link(:href, /basic_information/)
    $group_followers = $browser.link(:text, /Followers/)
    $group_access_dropdown = $browser.element(:xpath,"//div[@class='groups_followers_section']/div[contains(text(), 'Contributors')]/..//a[contains(@class, 'dropdown')]")
    $group_access_make_a_manager = $browser.link(:href, /Make a Manager/)
    $request_invite = $browser.button(:text => /Request Invite/)
    $approve_as_follower = $browser.button(:text => /Approve/)


######################
##Facebook Variables##
######################
    $facebook_email = $browser.text_field(:id, /email/)
    $facebook_password = $browser.text_field(:id, /pass/)
    $facebook_log_in = $browser.button(:value, /Log In/)
    $facebook_patch_sign_in = $browser.span(:text, /Sign in with Facebook/)
    $facebook_goto_app = $browser.button(:value, /Go to App/)
    $facebook_cancel_app = $browser.button(:value, /Cancel/)
    $facebook_allow = $browser.button(:value, /Allow/)
    $facebook_delete = $browser.button(:id, /u64e74v2/)
    $facebook_remove = $browser.div(:id, /app-settings-page/).input(:title, /Remove/)
    $facebook_remove_modal = $browser.button(:value, /Remove/)
    $facebook_dropdown = $browser.div(:id, /userNavigationLabel/)
    $facebook_logout = $browser.button(:value, /Log Out/)

####################
##Common Variables##
####################

#Primary Navigation Bar
    $location_site_logo = $browser.image(:class, /site-logo/)
    $header_nav_bar_menu = $browser.div(:id, /header-menu/)
    $the_news_menu = $browser.link(:text, /The News/)
    $calendar_menu = $browser.link(:href, /events/)
    $logged_in_avatar = $browser.image(:id, /header-avatar/)
    $sign_out = $browser.link(:text, /Sign Out/)
    $directory_menu = $browser.link(:href, /directory/)
    $get_newsletter = $browser.link(:href, /signup/) #requires update: not unique
    $join_menu = $browser.link(:href, /signup/)
    $sign_in_menu = $browser.link(:href, /login/)
    $twitter_icon_menu = $browser.link(:class, /nav-icons/).i(:class, /twitter/)
    $facebook_icon_menu = $browser.link(:class, /nav-icons/).i(:class, /facebook/)
    $search_textfield_menu = $browser.text_field(:id, /searchText/)
    $search_textfield = $browser.text_field(:class => /search-query/, :name => /keywords/)
    $search_text_button_menu = $browser.span(:class, /search-icon/)
    $search_text_button = $browser.button(:class, /search-icon/)
    $group_post_button = $browser.button(:id => /submit/, :name => /commit/, :text=> /Post/)

#Directory
    $directory_schools = $browser.link(:href=> /schools/, :class => /top-cat/)
    $directory_schools_first = $browser.element(:xpath, "//ul[@id='listings']/li[1]/div/div[2]/span[1]/strong/a")

#Secondary Navigation Bar
    $post_button = $browser.div(:class, /icon_post-menu/).button(:class, /dropdown-toggle/)

#Post Options
    $post_note = $browser.link(:text, /Note/)
    $post_article = $browser.link(:text, /Article/)
    $post_snapshot = $browser.link(:text, /Snapshot/)
    $post_event = $browser.link(:text, /Event/)

#Groups Navigation Bar 
    $group_expand = $browser.link(:class, /navbar_expand/)
    $group_manage = $browser.link(:text, /Manage your groups/)
    $group_start_new = $browser.link(:text, /Start a new group/)
    $group_more_groups = $browser.link(:class, /btn pull-right/)

#Page Footer Bar
    $bottom_patch_logo = $browser.link(:href, /patch.com/)
    $bottom_find_group = $browser.link(:text, /Find Groups/)
    $bottom_create_group = $browser.link(:text, /Create a Group/)
    $bottom_editor_avatar = $browser.link(:index, 113)
    $bottom_editor_profile = $browser.link(:index, 114)
    $bottom_editor_email = $browser.link(:href, /mailto:/)
    $bottom_patch_mobile_app_top = $browser.div(:class, /invisible-mobile/).i(:class, /iphone-app/)
    $bottom_patch_mobile_app_bottom = $browser.div(:class, /invisible-mobile/).i(:class, /iphone-app-tag/)
    $bottom_newsletter = $browser.link(:text, /Sign up for Newsletter/)
    $bottom_twitter = $browser.link(:text, /Follow us on Twitter/)
    $bottom_facebook = $browser.link(:text, /Like us on Facebook/)
    $bottom_note = $browser.link(:text, /Note/)
    $bottom_snapshot = $browser.link(:text, /Snapshot/)
    $bottom_article = $browser.link(:text, /Article/)
    $bottom_event = $browser.link(:text, /Event/)
    $bottom_review = $browser.link(:text, /Review/)
    $bottom_your_profile = $browser.link(:text, /Your Profile/)
    $bottom_edit_profile = $browser.link(:text, /Edit Profile/)
    $bottom_account_settings = $browser.link(:text, /Account Settings/)
    $bottom_notifications = $browser.link(:text, /Notifications/)
    $bottom_draft_posts = $browser.link(:text, /Draft Posts/)
    $bottom_scheduled_posts = $browser.link(:text, /Scheduled Posts/)
    $bottom_published_posts = $browser.link(:text, /Published Posts/)
    $bottom_your_groups = $browser.link(:text, /Your Groups/)
    $bottom_email_preferences = $browser.link(:text, /Email Preferences/)
    $bottom_solve_a_problem = $browser.link(:text, /Solve a problem/)
    $bottom_learn_patch = $browser.link(:text, /Learn about Patch/)
    $bottom_tips_help = $browser.link(:text, /Tips & Help/)
    $bottom_contact_us = $browser.link(:text, /Contact us/)
    $bottom_about_us = $browser.link(:text, /About us/)
    $bottom_terms_of_use = $browser.link(:text, /Terms of Use/)
    $bottom_privacy_policy = $browser.link(:text, /Privacy Policy/)
    $bottom_patch_blog = $browser.link(:text, /Patch Blog/)
    $bottom_advertise = $browser.link(:text, /Advertise/)
    $bottom_about_ads = $browser.link(:text, /About our Ads/)
    $bottom_claim_listing = $browser.link(:text, /Claim your listing/)
    $bottom_add_business = $browser.link(:text, /Add your business/)
    $bottom_patch_u = $browser.link(:text, /PatchU/)
    $bottom_volunteer = $browser.link(:text, /Volunteer/)
    $bottom_feedback = $browser.link(:text, /Feedback/)


  end
end

