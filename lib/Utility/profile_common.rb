module Profile_Common

  def login
    $browser.cookies.clear
    ###maximize_browser
    $email.set("#{$user_master_email}")
    $password.set("#{$user_master_password}")
    $sign_in_button.click
    if $welcome_to_the_new_patch_dialog.exists?
      $welcome_to_the_new_patch_dialog.click
    end
    if $close_tour_dialog.exists?
      $close_tour_dialog.click
    end
  end

  def guest_user
    $browser.goto($patch)
  end

  def login_as_user1
    $browser.cookies.clear
    $email.when_present(60).set("#{$user_master_email}")
    $password.when_present(60).set("#{$user_master_password}")
    $sign_in_button.when_present(60).click
    sleep 5
  end

  def login_as_user2
    $browser.cookies.clear
    $email.when_present(60).set("#{$user_master_email_2}")
    $password.when_present(60).set("#{$user_master_password}")
    $sign_in_button.when_present(60).click
    sleep 5
  end

  def logout_common
     $browser.goto($patch_logout)
    sleep 5
  end

  def go_to_edit_profile_page
    $browser.goto($patch_users)
    $profile_edit_button.when_present(60).click
    sleep 5
  end
	
	def navigate_to_profile
		$profile_account_avatar.click
		sleep 2
		$your_profile.click
	end
	
	
  def verify_elements_left_nav(testId)
    assert $view_profile.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find View Profile link.")
    puts e

    assert $profile_personal.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Personal_Info link.")
    puts e

    assert $profile_change_pass.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Change Password link.")
    puts e

    assert $profile_updates.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Updates link.")
    puts e

    assert $profile_your_posts.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Your Posts link.")
    puts e

    assert $profile_email_settings.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Email Settings link.")
    puts e

    assert $profile_manage_groups.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Manage Groups link.")
    puts e
  end

  def click_group_icon_verify_redirect(groupIconName)
    $browser.div(:class => /pull-left avatar avatar-mid/).link(:href => Regexp.new(groupIconName)).when_present(60).click
    sleep 5
    assert $browser.url.include? groupIconName
    $browser.back
    sleep 5
  end

  def group_icon_redirect
    $group_icon_on_manage_group.when_present(60).click
    sleep 5
    assert $browser.url.include? "groups"
    $browser.back
    sleep 5
  end

  def click_group_name_verify_redirect(groupName)
    $browser.link(:href => Regexp.new(groupName), :index => 1).when_present(60).click
    sleep 5
    assert $browser.url.include? groupName
    $browser.back
    sleep 5
  end

  def email_settings_redirect
    $email_settings_manage_group.when_present(60).click
    sleep 5
    assert $browser.url.include? "email"
    $browser.back
    sleep 5
  end

  def following_button_to_unfollow_and_follow
    if $profile_manage_group_follow.text == "Following"
      $profile_manage_group_follow.when_present(60).click
      sleep 3
      assert $profile_manage_group_follow.text == "Follow"
    end

    if $profile_manage_group_follow.text == "Follow"
      $profile_manage_group_follow.when_present(60).click
      sleep 3
      assert $follow_success_ok_button.exists?
      $follow_success_ok_button.click
    end

  end

  def click_follow_verify_redirect
    $browser.button(:class, /group-follow/).when_present(60).click
    sleep 5
    assert $browser.url.include? 'login'
    $browser.back
    sleep 5
  end

end   #end of Module : Profile Common

module Change_Password_Methods


  def enter_wrong_old_password(oldWrongPass)
    $profile_old_pass.when_present(60).set oldWrongPass
    $profile_new_pass.when_present(60).set "newPass"
    $profile_confirm_pass.when_present(60).set  "newPass"
    $profile_save_changes.when_present(60).click
    sleep 3
  end

  def make_sure_your_passwords_match(oldCorrectPass,newValidPass,unMatchedPass)
    $profile_old_pass.when_present(60).set oldCorrectPass
    $profile_new_pass.when_present(60).set newValidPass
    $profile_confirm_pass.when_present(60).set unMatchedPass
    sleep 3
    assert $browser.text.include? "Please make sure that your passwords match"
    $profile_confirm_pass.when_present(60).set newValidPass
    sleep 3
    assert !($browser.text.include? "Please make sure that your passwords match")
  end

  def verify_save_button_not_enabled(oldCorrectPass,newValidPass,unMatchedPass)
    $profile_old_pass.when_present(60).set oldCorrectPass
    assert !($profile_save_changes.enabled?)
    $profile_new_pass.when_present(60).set newValidPass
    assert !($profile_save_changes.enabled?)
    $profile_confirm_pass.when_present(60).set unMatchedPass
    assert !($profile_save_changes.enabled?)
  end

  def verify_save_button_enabled(oldCorrectPass,newValidPass,unMatchedPass)
    $profile_old_pass.when_present(60).set oldCorrectPass
    $profile_new_pass.when_present(60).set newValidPass
    $profile_confirm_pass.when_present(60).set newValidPass
    assert $profile_save_changes.enabled?
  end

  def enter_new_password_less_than_seven_char(lessThan7CharPass)
    $profile_old_pass.when_present(60).clear
    $profile_old_pass.when_present(60).set "oldPassword"
    $profile_new_pass.when_present(60).clear
    $profile_new_pass.when_present(60).set lessThan7CharPass
    $profile_confirm_pass.when_present(60).clear
    $profile_confirm_pass.when_present(60).set lessThan7CharPass
    $profile_save_changes.when_present(60).click
    sleep 3
  end

  def verify_password_changed
    $email.when_present(60).set("#{$user_master_email}")
    $password.when_present(60).set("#{$user_master_password}")
    $sign_in_button.when_present(60).click
    sleep 3
    assert $browser.text.include? "Password incorrect"
    assert $email_error_no_record.exists?
  end

  def verify_cancel_reverted_password_change()
    change_password_original_to_temp $user_master_email, "password123"
    $profile_cancel.when_present(60).click
    logout_common
    $email.when_present(60).set("#{$user_master_email}")
    $password.when_present(60).set("#{$user_master_password}")
    $sign_in_button.when_present(60).click
    sleep 5
    assert $profile_account_avatar.exists?
  end

  def go_to_change_password_page
    go_to_edit_profile_page
    $profile_change_pass.when_present(60).click
    sleep 5
  end

  def save_password_changes
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $password_changed_successfully.exists?
  end

  def change_password_original_to_temp(original, temp)
    $profile_old_pass.when_present(60).set original
    $profile_new_pass.when_present(60).set temp
    $profile_confirm_pass.when_present(60).set  temp
  end

  def change_password_temp_to_original(temp, original)
    $profile_old_pass.when_present(60).set temp
    $profile_new_pass.when_present(60).set original
    $profile_confirm_pass.when_present(60).set original
  end

  def retain_original_password(original,temp)
    $password.when_present(60).set temp
    $sign_in_button.when_present(60).click
    go_to_change_password_page
    change_password_temp_to_original temp, original
  end


  def verify_elements_exists_on_change_password_page(testId)
    begin
      $profile_old_pass.wait_until_present(60)
      assert $profile_old_pass.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Old password text field."
    end

    begin
      $profile_new_pass.wait_until_present(60)
      assert $profile_new_pass.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find New password text field."
    end

    begin
      $profile_confirm_pass.wait_until_present(60)
      assert $profile_confirm_pass.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Confirm password text field."
    end

    begin
      $profile_cancel.wait_until_present(60)
      assert $profile_cancel.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Cancel link."
    end
  end

  def verify_text_on_change_password_page(testId)

    begin
      assert $browser.text.include? "Change your Password"
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Change your Password."
    end

    begin
      assert $browser.text.include? "Old password"
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Old password."
    end

    begin
      assert $browser.text.include? "New password"
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find New password."
    end

    begin
      assert $browser.text.include? "Confirm password"
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Confirm password."
    end

  end

end




module Edit_Profile

end    # end of Module : Edit Profile

module Edit_Profile_details

  def verify_elements_on_edit_profile(testId)

    assert $profile_picture.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Profile Picture.")
    puts e

    assert $profile_name.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Profile Name text field.")
    puts e

    assert $profile_gender.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Profile Gender Select List.")
    puts e

    assert $profile_home_patch.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Home Patch Select List.")
    puts e

    assert $profile_resident_mm.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Profile Resident Month Select List.")
    puts e

    assert $profile_resident_dd.exists?
    attr_reader :escue => e
    puts ("#{testId}: FAILED! Unable to find Profile Resident Day Select List.")
    puts e

    assert $profile_resident_yy.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Profile Resident Year Select List.")
    puts e

    assert $profile_i_am_a.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find I Am A optional text field.")
    puts e

    assert $profile_more_about.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find More About text field.")
    puts e

    assert $profile_community.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Community text field")
    puts e

    assert $profile_cancel.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Cancel link")
    puts e

    assert $profile_save_changes.exists?
  rescue => e
    puts ("#{testId}: FAILED! Unable to find Save Changes button")
    puts e

  end

  def verify_i_am_a_text_optional
    $profile_i_am_a.when_present(60).clear
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_i_am_a.value == ""
  end


  def verify_little_more_about_me_text_optional
    $profile_more_about.when_present(60).clear
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_more_about.value == ""
  end

  def verify_little_more_about_my_community
    $profile_community.when_present(60).clear
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_community.value == ""
  end

  def verify_text_can_be_entered_saved_on_i_am_a_textfield
    iamaText = "I am a text automated #{random}"
    $profile_i_am_a.when_present(60).set iamaText
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_i_am_a.value == iamaText
  end

  def verify_text_can_be_entered_saved_on_little_more_about_me
    littleText = "Little more about me automated #{random}"
    $profile_more_about.when_present(60).set littleText
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_more_about.value == littleText
  end

  def verify_text_can_be_entered_saved_on_about_my_community
    aboutCommunityText = "I love my community. It's a nice place to live automated #{random}"
    $profile_community.when_present(60).set aboutCommunityText
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_community.value == aboutCommunityText
  end

  def verify_user_name_populated_on_name_textfield(testId,userName)
    begin
      assert $profile_name.value == userName
    rescue => e
      puts ("#{testId}: FAILED! User name didn't match")
      puts e
    end
  end

  def verify_user_names_are_not_required_to_be_unique(userName)
    save_name(userName)
    logout_common
    login_as_user2
    go_to_edit_profile_page
    save_name(userName)
  end

  def verify_valid_profile_pic_uploaded(fname)
    $profile_pic_upload.set("/Users/asad/desktop/automation/4feb13/patch-automation/test/TestData/#{fname}.JPG")
    #$image_crop.drag_and_drop_by 100, 50
    sleep 3
    $save_changes_profile_pic.when_present(60).click
    sleep 5
    #assert !($image_crop.visible?)
    $profile_save_changes.when_present(60).click
    sleep 5
  end

  def verify_unable_to_upload_non_image_file(fname)
    $profile_pic_upload.set("/Users/asad/desktop/automation/4feb13/patch-automation/test/TestData/#{fname}.pdf")
    sleep 5
    assert !($image_crop.exists?)
    $profile_cancel.click
  end

  def verify_user_able_to_close_photo_upload_dialog
    $profile_pic_upload.set("/Users/asad/desktop/automation/4feb13/patch-automation/test/TestData/valid.JPG")
    sleep 5
    $close_photo_upload_dialog.click
  end

  def verify_user_able_to_cancel_photo_upload_dialog
    $profile_pic_upload.set("/Users/asad/desktop/automation/4feb13/patch-automation/test/TestData/valid.JPG")
    sleep 5
    $profile_cancel.click
  end

  def verify_name_change_is_saved(testId, permName, tempName)
    begin
      $profile_name.when_present(60).set tempName
      $profile_save_changes.when_present(60).click
      sleep 3
      assert $profile_name.value == tempName
      $profile_name.when_present(60).set permName
      $profile_save_changes.when_present(60).click
      sleep 3
      assert $profile_name.value == permName
    rescue => e
      puts ("#{testId}: FAILED! Name is not saved")
      puts e
    end
  end

  def save_name(name)
      $profile_name.when_present(60).set name
      $profile_save_changes.when_present(60).click
      sleep 3
      assert $profile_name.value == name
  end

  def verify_name_validation(testId, permName, tempName)
      $profile_name.when_present(60).set tempName
      $profile_save_changes.when_present(60).click
      sleep 3
      assert $profile_name.value == tempName
      $profile_name.when_present(60).set permName
      $profile_save_changes.when_present(60).click
      sleep 3
      assert $profile_name.value == permName
  end

  def verify_gender_change_is_saved(male, female,other)
      $profile_gender.when_present(60).select male
      $profile_save_changes.when_present(60).click
      $profile_gender.wait_until_present(60)
      assert $profile_gender.selected? male
      $profile_gender.when_present(60).select female
      $profile_save_changes.when_present(60).click
      $profile_gender.wait_until_present(60)
      assert $profile_gender.selected? female
      $profile_gender.when_present(60).select other
      $profile_save_changes.when_present(60).click
      $profile_gender.wait_until_present(60)
      assert $profile_gender.selected? other
  end


  def verify_hometown_change_is_saved(permHomeTown, tempHomeTown)
      $profile_home_patch.when_present(60).select tempHomeTown
      $profile_save_changes.when_present(60).click
      $profile_home_patch.wait_until_present
      assert $profile_home_patch.selected? tempHomeTown
      $profile_home_patch.when_present(60).select permHomeTown
      $profile_save_changes.when_present(60).click
      $profile_home_patch.wait_until_present
      assert $profile_home_patch.selected? permHomeTown
  end

  def verify_users_default_town_name_displayed_as_home_patch(testId, homeTown)
    begin
      $profile_home_patch.wait_until_present(60)
      assert $profile_home_patch.selected? homeTown
    rescue => e
      puts ("#{testId}: FAILED! Default home town not displayed")
      puts e
    end
  end

  def verify_gender_shown_other_as_default(testId)
    begin
      $profile_gender.wait_until_present(60)
      assert $profile_gender.selected? "Other"
    rescue => e
      puts ("#{testId}: FAILED! Gender is not selected as Other")
      puts e
    end
  end

  def verify_gender_has_male_followed_by_female_option(testId)
    begin
    opt = []
    $profile_gender.options.each{|option| opt<< option.text}
    rescue => e
    puts ("#{testId}: FAILED! No option found")
    puts e
    end

    begin
      assert opt[0] == "Male"
      assert opt[1] == "Female"
    rescue => e
      puts ("#{testId}: FAILED! Male option not followed by Female")
      puts e
    end
  end

  def verify_day_can_only_be_selected_from_1_to_31(testId, from, to)
    begin
      opt = []
      $profile_resident_dd.options.each{|option| opt<< option.text}
      i=from
      while i<= to
        assert opt[i] == "#{i}"
        $profile_resident_dd.select opt[i]
        i = i+1
      end
    rescue => e
      puts ("#{testId}: FAILED! Day can't be selected from 1 to 31")
      puts e
    end
  end

  def verify_month_can_only_be_selected_from_Jan_to_Dec(testId, from, to)
    begin
      opt = []
      $profile_resident_mm.options.each{|option| opt<< option.text}
      i=from
      while i<= to
        $profile_resident_mm.select opt[i]
        i = i+1
      end
    rescue => e
      puts ("#{testId}: FAILED! Month can't be selected from Jan to Dec")
      puts e
    end
  end

  def verify_year_can_only_be_selected_from_1900_to_current_year(testId, from, to)
    begin
      opt = []
      $profile_resident_yy.options.each{|option| opt<< option.text}
      i=1
      while i< opt.length
        $profile_resident_yy.select opt[i]
        i = i+1
      end
      assert opt[1]== from
      assert opt[opt.length-1]== to
    rescue => e
      puts ("#{testId}: FAILED! Year can't be selected from 1900 to Current Year")
      puts e
    end
  end

  def  verify_user_can_return_date_to_the_default(month,day,year)
    $profile_resident_mm.when_present(60).select month
    $profile_resident_dd.when_present(60).select day
    $profile_resident_yy.when_present(60).select year
    $profile_save_changes.click
    sleep 5
    assert $profile_resident_mm.selected? month
    assert $profile_resident_dd.selected? day
    assert $profile_resident_yy.selected? year
  end

  def  verify_user_can_save_date(month,day,year)
    $profile_resident_mm.when_present(60).select month
    $profile_resident_dd.when_present(60).select day
    $profile_resident_yy.when_present(60).select year
    $profile_save_changes.click
    sleep 5
    assert $profile_resident_mm.selected? month
    assert $profile_resident_dd.selected? day
    assert $profile_resident_yy.selected? year
  end

  def verify_user_is_not_able_to_specify_only_the_month_drop_down(month,day,year)
    $profile_resident_mm.when_present(60).select month
    $profile_resident_dd.when_present(60).select day
    $profile_resident_yy.when_present(60).select year
    $profile_save_changes.click
    sleep 5
    assert $profile_resident_mm.selected? "Month"
    assert $profile_resident_dd.selected? day
    assert $profile_resident_yy.selected? year
  end

  def verify_user_is_not_able_to_specify_only_the_day_drop_down(month,day,year)
    $profile_resident_mm.when_present(60).select month
    $profile_resident_dd.when_present(60).select day
    $profile_resident_yy.when_present(60).select year
    $profile_save_changes.click
    sleep 5
    assert $profile_resident_mm.selected? month
    assert $profile_resident_dd.selected? "Day"
    assert $profile_resident_yy.selected? year
  end

  def verify_user_is_not_able_to_specify_only_the_year_drop_down(month,day,year)
    $profile_resident_mm.when_present(60).select month
    $profile_resident_dd.when_present(60).select day
    $profile_resident_yy.when_present(60).select year
    $profile_save_changes.click
    sleep 5
    assert $profile_resident_mm.selected? month
    assert $profile_resident_dd.selected? day
    assert $profile_resident_yy.selected? "Year"
  end

  def verify_cancel_reverted_changes_edit_profile(testId)
    begin
      $profile_name.when_present(60).set "temp Name"
      $profile_gender.when_present(60).select "Male"
      $profile_resident_mm.when_present(60).select "March"
      $profile_resident_dd.when_present(60).select "18"
      $profile_resident_yy.when_present(60).select "1981"
      $profile_cancel.when_present(60).click
      sleep 3
      assert $profile_name.value != "temp Name"
      assert $profile_gender.value != "Male"
      assert $profile_resident_mm.value != "March"
      assert $profile_resident_dd.value != "18"
      assert $profile_resident_yy.value != "1981"
    rescue => e
      puts ("#{testId}: FAILED! Cancel didn't revert changes")
      puts e
    end
  end

  def verify_cancel_reverted_changes
    randomEmail = "testrandom#{random}@gmail.com"
    $profile_email.when_present(60).set randomEmail
    $profile_password.when_present(60).set $user_password
    $profile_cancel.when_present(60).click
    $profile_email.wait_until_present
    assert  $profile_email.value != randomEmail
    assert  $profile_email.value == $user_master_email

    randomPhone = "#{random}"
    $profile_phone.when_present(60).set randomPhone
    $profile_password.when_present(60).set $user_password
    $profile_cancel.when_present(60).click
    assert  $profile_phone.value != randomPhone
  end

end # end of Module : Edit Profile Details

module Email_Settings

  def check_save_verify_checked_all()
    checkBoxes = ["bellmore",
                  "CommentOnCommentedPost",
                  "CommentOnPost","Repost",
                  "ToAuthorPostIsEdited",
                  "ToAuthorPostIsModerated",
                  "InvitationJoinGroup",
                  "GroupAccessModerator",
                  "GroupAccessContributor",
                  "GroupAccessFollowerPrivateGroup",
                  "FollowNotificationForModerator",
                  "PostForModerator",
                  "RequestFollowPrivateGroup",
                  "NewPostToModerate",
                  "PostEditedByAnotherManager",
                  "PostRejectRemove",
                  "PostModeratedByAnotherManager"]

=begin
    checkBoxes = ["bellmore",
                  "CommentOnCommentedPost",
                  "CommentOnPost","Repost",
                  "ToAuthorPostIsEdited"]
=end

    checkBoxes.each do |cbox|
      if ($browser.checkbox(:value, Regexp.new(cbox)).set? == true)
        $browser.checkbox(:value, Regexp.new(cbox)).clear
      end
    end
    $profile_save_changes.click
    sleep 5
    checkBoxes.each do |cbox|
      $browser.checkbox(:value, Regexp.new(cbox)).set
      $profile_save_changes.click
      sleep 5
      assert $browser.checkbox(:value, Regexp.new(cbox)).set?
    end
  end

  def verify_cancel_reverted_changes_email_settings()
    checkBoxes = ["bellmore",
                  "CommentOnCommentedPost",
                  "CommentOnPost","Repost",
                  "ToAuthorPostIsEdited",
                  "ToAuthorPostIsModerated",
                  "InvitationJoinGroup",
                  "GroupAccessModerator",
                  "GroupAccessContributor",
                  "GroupAccessFollowerPrivateGroup",
                  "FollowNotificationForModerator",
                  "PostForModerator",
                  "RequestFollowPrivateGroup",
                  "NewPostToModerate",
                  "PostEditedByAnotherManager",
                  "PostRejectRemove",
                  "PostModeratedByAnotherManager"]

=begin
    checkBoxes = ["bellmore",
                  "CommentOnCommentedPost",
                  "CommentOnPost","Repost",
                  "ToAuthorPostIsEdited"]
=end

    checkBoxes.each do |cbox|
      if ($browser.checkbox(:value, Regexp.new(cbox)).set? == false)
        $browser.checkbox(:value, Regexp.new(cbox)).set
      end
    end
    $profile_save_changes.click
    sleep 5
    checkBoxes.each do |cbox|
      if ($browser.checkbox(:value, Regexp.new(cbox)).set? == true)
        $browser.checkbox(:value, Regexp.new(cbox)).clear
      end
    end
    $profile_cancel.click
    sleep 5
    checkBoxes.each do |cbox|
       assert $browser.checkbox(:value, Regexp.new(cbox)).set?
    end
  end


  def check_checkbox_if_unchecked(*args)
    i = 0;
    while i < args.length  do
        if ($browser.checkbox(:name, Regexp.new(args[i])).set? == false)
          $browser.checkbox(:name, Regexp.new(args[i])).set
        end
      i +=1
    end
  end

  def select_from_list(groupName, selectOption)
    $browser.select_list(:xpath, "//a[contains(text(), '#{groupName}')]/../../../../div/select").select selectOption
  end

  def click_more_links_verify_text_expands(text)
    textBeforeMoreLinkClicked = $browser.element(:xpath => "//a[contains(text(), '#{text}')]/../../..//p").text
    textLengthBeforeMoreLinkClicked = textBeforeMoreLinkClicked.length
    assert textBeforeMoreLinkClicked.include? '...More'
    $browser.element(:xpath => "//a[contains(text(), '#{text}')]/../../..//p//a").when_present(60).click
    sleep 3
    textAfterMoreLinkClicked = $browser.element(:xpath => "//a[contains(text(), '#{text}')]/../../..//p").text
    textLengthAfterMoreLinkClicked = textAfterMoreLinkClicked.length
    assert !(textAfterMoreLinkClicked.include? '...More')
    assert textLengthAfterMoreLinkClicked > textLengthBeforeMoreLinkClicked
  end

  def verify_option_selected(groupName, selectOption)
    optionSelected = $browser.select_list(:xpath, "//a[contains(text(), '#{groupName}')]/../../../../div/select").selected? selectOption
    assert  optionSelected == true
  end

  def verify_option_not_selected(groupName, selectOption)
    optionSelected = $browser.select_list(:xpath, "//a[contains(text(), '#{groupName}')]/../../../../div/select").selected? selectOption
    assert  optionSelected == false
  end

  def uncheck_checkbox_if_checked(*args)
    i = 0;
    while i < args.length  do
      if ($browser.checkbox(:name, Regexp.new(args[i])).set? == true)
        $browser.checkbox(:name, Regexp.new(args[i])).clear
      end
      i +=1
    end
  end

  def verify_cancel_reverted_changes_email_settings(*args)
    i = 0;
    while i < args.length  do
      assert $browser.checkbox(:name, Regexp.new(args[i])).set? == true
      i +=1
    end
  end

  def verify_elements_on_email_settings_page(testId)

    begin
      assert $profile_daily.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Profile Daily checkbox."
      puts e
    end

    begin
      assert $profile_comments.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Comments checkbox."
      puts e
    end

    begin
      assert $profile_post_comment.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Post Comments checkbox."
      puts e
    end

    begin
      assert $profile_reposted.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Reposted checkbox."
      puts e
    end

    begin
      assert $profile_group_invite.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Group Invite checkbox."
      puts e
    end

    begin
      assert $profile_group_manager.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Group Manager checkbox."
      puts e
    end

    begin
      assert $profile_group_contribute.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Group Contribute checkbox."
      puts e
    end

    begin
      assert $profile_group_follower.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Group Follower checkbox."
      puts e
    end

    begin
      assert $profile_follows.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Follower checkbox."
      puts e
    end

    begin
      assert $profile_posts.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Posts checkbox."
      puts e
    end

    begin
      assert $profile_request.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Requests checkbox."
      puts e
    end

    begin
      assert $profile_preferences.exists?
    rescue => e
      puts "#{testId}: FAILED! Unable to find Preferences List box."
      puts e
    end

  end

end    # end of Module : Email Settings

module Manage_Groups

	def verify_elements_on_manage_groups_page(testId)
    begin
      assert $profile_group_email.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Email Settings button."
    end

    begin
      assert $profile_manage_group_follow.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Following button."
    end
  end

	def verify_the_links_on_the_side_bar_of_manage_groups(testId)
      begin
        assert $profile_show_me_how.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find Show Me How."
      end
      begin
        assert $profile_how_to_edit_your_profile.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find How to edit your profile link."
      end
      begin
        assert $profile_how_to_change_your_account_details.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find How to edit your account details link."
      end
      begin
        assert $profile_how_to_change_your_password.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find How to change your password link."
      end
      begin
        assert $profile_about_updates.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find About updates link."
      end
      begin
        assert $profile_how_to_edit_your_email_settings.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find How to edit your email settings link."
      end
      begin
        assert $profile_about_your_posts.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find About your posts link."
      end
      begin
        assert $profile_how_to_manage_your_groups.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find How to manage your groups link."
      end
      begin
        assert $profile_see_more_help_topics.exists?
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find See more help topics link."
      end

   end

    def click_on_any_group(groupName)
        $browser.link(:text => Regexp.new(groupName)).click
    end

	def profileLogin
		$browser.cookies.clear
		$browser.goto($patch_login)
 		$email.when_present(60).set("#{$user_master_email}")
		$password.when_present(60).set("#{$user_master_password}")
		$sign_in_button.when_present(60).click
	end	
	
	def navigate_to_manage_groups
		profileLogin
		$profile_account_avatar.when_present(60).click
		$profile_manage_groups.when_present(60).click
	end

end # end of Module : Manage Groups

module Personal_Info

  def verify_elements_on_personal_info_page(testId)
    begin
      assert $profile_email.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Email text field."
    end

    begin
      assert $profile_phone.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Phone text field."
    end

    begin
      assert $profile_password.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Password text field."
    end

    begin
      assert $profile_cancel.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Cancel link."
    end

    begin
      assert $profile_save_changes.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Save button."
    end
  end

  def verify_expected_email_id_shown_in_email_field(expectedEmail)
      assert $profile_email.value == expectedEmail
  end

  def verify_valid_email_saved
    randomEmail = "testrandom#{random}@gmail.com"
    $profile_email.when_present(60).click
    $profile_email.when_present(60).set randomEmail
    sleep 5
    $profile_password.when_present(60).set $user_master_password
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_email.value == randomEmail
    retain_original_email_id
  end

  def retain_original_email_id
    $profile_email.when_present(60).click
    $profile_email.when_present(60).set $user_master_email
    $profile_password.when_present(60).set $user_master_password
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_email.value == $user_master_email
  end

  def verify_phone_saved
    randomPhone = "#{random}"
    $profile_phone.when_present(60).click
    $profile_phone.when_present(60).set randomPhone
    $profile_password.when_present(60).set $user_master_password
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_phone.value == randomPhone
  end

  def verify_error_message_for_phone
    randomPhone = "#{random}"
    $profile_phone.when_present(60).click
    $profile_phone.when_present(60).set randomPhone
    $profile_password.when_present(60).set "incorrectPass"
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_incorrect_pass.exists?

    $profile_email.when_present(60).click
    $profile_email.when_present(60).set "testrandom#{random}@gmail"
    $profile_phone.when_present(60).set randomPhone
    $profile_password.when_present(60).set $user_master_password
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $invalid_email_error.exists?

    $profile_phone.when_present(60).click
    $profile_phone.when_present(60).clear
    $profile_password.when_present(60).set $user_master_password
    $profile_save_changes.when_present(60).click
    sleep 5
    assert !($profile_incorrect_pass.exists?)

  end

  def change_email_id_verify_user_gets_prompt_to_enter_password
    randomEmail = "testrandom#{random}@gmail.com"
    $profile_email.when_present(60).click
    $profile_email.when_present(60).set randomEmail
    $password_prompt_message.wait_until_present(60)
    assert $password_prompt_message.exists?
  end

  def change_phone_verify_user_gets_prompt_to_enter_password
    randomPhone = "#{random}"
    $profile_phone.when_present(60).click
    $profile_phone.when_present(60).set randomPhone
    $password_prompt_message.wait_until_present(60)
    sleep 5
    assert $password_prompt_message.exists?
  end

  def verify_cancel_reverted_changes_personal_info
    randomEmail = "testrandom#{random}@gmail.com"
    $profile_email.when_present(60).set randomEmail
    $profile_password.when_present(60).set $user_master_password
    $profile_cancel.when_present(60).click
    sleep 5
    assert $profile_email.value != randomEmail
    assert $profile_email.value == $user_master_email

    randomPhone = "#{random}"
    $profile_phone.when_present(60).set randomPhone
    $profile_password.when_present(60).set $user_password
    $profile_cancel.when_present(60).click
    sleep 5
    assert  $profile_phone.value != randomPhone
  end


  def enter_wrong_password_verify_error_message
    $profile_password.when_present(60).set "wrongpassword"
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_incorrect_pass.exists?
  end

  def verify_save_button_disabled_until_password_entered
    $profile_email.when_present(60).click
    $profile_email.when_present(60).set $user_master_email
    $profile_phone.when_present(60).set "#{random}"
    assert $profile_save_changes.disabled?
  end

  def verify_error_message_for_incorrect_email
    $profile_email.when_present(60).click
    $profile_email.when_present(60).set "testrandom#{random}@gmail"
    $profile_password.when_present(60).set $user_master_password
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $invalid_email_error.exists?
    $profile_email.when_present(60).click
    $profile_email.when_present(60).set "testrandom#{random}@gmail.com"
    $profile_password.when_present(60).set "incorrectpass"
    $profile_save_changes.when_present(60).click
    sleep 5
    assert $profile_incorrect_pass.exists?
  end

end   # end of Module : Personal_info

module Updates

  def go_to_updates_page
    go_to_edit_profile_page
    $profile_updates_side_link.when_present(60).click
    sleep 5
  end

  def verify_elements_exists_on_login_page
    begin
      $email.wait_until_present(60)
      assert $email.exists?
    rescue => e
      puts e
      puts "Login Page: FAILED! Unable to find Email text field."
    end

    begin
      $password.wait_until_present(60)
      assert $password.exists?
    rescue => e
      puts e
      puts "Login Page: FAILED! Unable to find Password text field."
    end

    begin
      $sign_in_button.wait_until_present(60)
      assert $sign_in_button.exists?
    rescue => e
      puts e
      puts "Login Page: FAILED! Unable to find Sign In button."
    end
  end

end # End of Module : Updates

module View_Profile

  def verify_text_on_view_profile_page
    begin
      assert $browser.text.include? "smokey"
    rescue => e
      puts e
      puts "VP1T01: FAILED! Unable to find Profile Name."
    end

    begin
      assert $browser.text.include? "Managed Groups"
    rescue => e
      puts e
      puts "VP1T01: FAILED! Unable to find Managed Groups."
    end

    begin
      assert $browser.text.include? "Following"
    rescue => e
      puts e
      puts "VP1T01: FAILED! Unable to find Following."
    end

    begin
      assert $browser.text.include? "Posts"
    rescue => e
      puts e
      puts "VP1T01: FAILED! Unable to find Posts."
    end

    begin
      assert $browser.text.include? "Comments"
    rescue => e
      puts e
      puts "VP1T01: FAILED! Unable to find Comments."
    end

    begin
      assert $browser.text.include? "Manager Of"
    rescue => e
      puts e
      puts "VP1T01: FAILED! Unable to find Manager Of."
    end
  end

  def verify_elements_on_view_profile_page(testId)
    begin
      assert $profile_edit_button.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Edit Button."
    end
    begin
      assert $profile_picture_view.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Profile picture on View Profile page."
    end
  end

  def click_on_any_group_as_guest(groupName)
    $browser.span(:text => Regexp.new(groupName)).click
  end

  def verify_edit_button_not_exist
    profileButtonExists = $profile_edit_link.visible?
    assert profileButtonExists == false
  end



  def verify_stats_appear(testId, *args)
    i = 0;
    while i < args.length  do
      begin
        if(args[i]== "Comments")
          assert $browser.span(:class=> /stat/).exists?
        else
          assert $browser.li(:text => Regexp.new(args[i])).strong(:class=> /stat/).exists?
        end
      rescue => e
        puts e
        puts "#{testId}: FAILED! Unable to find #{args[i]} on page."
      end
      i +=1
    end

  end


end # End of Module : View Profile

module Your_Post

  def go_to_draft_page()
    $profile_new_draft.when_present(60).click
    $profile_post_now.wait_until_present(60)
  end

  def verify_elements_on_current_drafts(testId)
    begin
      assert $profile_current.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Current Profile."
    end

    begin
      assert $count_of_drafts.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Count of drafts"
    end
  end

  def verify_elements_on_drafts()
    begin
      assert $profile_edit_post.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Edit button"
    end

    begin
      assert $profile_post_now.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Post Now button"
    end

    begin
      assert $profile_delete.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Delete button"
    end

  end

  def verify_elements_on_published_post(testId)
    begin
      assert $profile_published.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Published Post."
    end

    begin
      assert $count_of_published.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Count of Published post."
    end

  end

  def verify_elements_on_scheduled_post(testId)
    begin
      assert $profile_edit_post.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Edit button"
    end

    begin
      assert $profile_delete.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Delete button"
    end
    begin
      assert $count_of_scheduled.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Count of Scheduled post"
    end
  end

  def verify_elements_on_post(testId)
    begin
      assert $repost_link_on_post.exists?
      #assert $repost_button_on_post.exists? FRY env has this button but staging don't
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Repost option on Post."
    end
    begin
      assert $comment_link.exists?
      #assert $comment_button.exists? FRY env has this button but staging don't
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Comment option on Post."
    end
    begin
      assert $profile_edit_post.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Edit on Post."
    end
    begin
      assert $delete_post_button.exists?
    rescue => e
      puts e
      puts "#{testId}: FAILED! Unable to find Delete button on Post."
    end
  end

  def go_to_post_page()
    $profile_published_post.when_present(60).click
    sleep 5
  end

  def verify_draft_count_updated_after_creating_new_draft()
    go_to_draft_tab_on_your_post_page
    numberOfDraftCurrent = count_draft_current
    create_new_draft("Living","House & Home")
    go_to_draft_tab_on_your_post_page
    numberOfDraftAfterCreatingNewDraft = count_draft_current
    assert numberOfDraftAfterCreatingNewDraft == numberOfDraftCurrent + 1
  end

  def verify_published_post_count_updated_after_deleting_post()
    numberOfPublishedPostCurrent = count_post_current
    go_to_post_page
    verify_elements_on_post "test_ID_25890_published_posts"
    $delete_post_button.when_present(60).click
    $delete_on_delete_this_post.when_present(60).click
    $post_successfully_deleted.wait_until_present(60)
    $profile_account_avatar.when_present(60).click
    $profile_your_posts.when_present(60).click
    $count_of_published.wait_until_present(60)
    numberOfPublishedPostAfterPostDeleted = count_post_current
    assert numberOfPublishedPostAfterPostDeleted == numberOfPublishedPostCurrent - 1
  end

  def verify_post_and_draft_count_updated_after_draft_posted()
    go_to_draft_tab_on_your_post_page
    numberOfPublishedPostCurrent = count_post_current
    numberOfDraftBeforeDraftPosted = count_draft_current
    go_to_draft_page
    $profile_post_now.when_present(60).click
    go_to_draft_tab_on_your_post_page
    numberOfPublishedPostAfterDraftPosted = count_post_current
    numberOfDraftAfterDraftPosted = count_draft_current
    assert numberOfPublishedPostAfterDraftPosted == numberOfPublishedPostCurrent + 1
    assert numberOfDraftAfterDraftPosted == numberOfDraftBeforeDraftPosted - 1
  end

  def verify_draft_count_updated_after_deleting_draft()
    numberOfDraftCurrent = count_draft_current
    go_to_draft_page
    $profile_delete.when_present(60).click
    $profile_delete_delete.wait_until_present
    $profile_delete_delete.when_present(60).click
    go_to_draft_tab_on_your_post_page
    numberOfDraftAfterDeleting = count_draft_current
    assert numberOfDraftAfterDeleting == numberOfDraftCurrent - 1
  end


end

module Create_New_Group

  def verify_group_created(groupType, groupCategory)
    if $check_for_error.exists?
      $browser.goto($patch_new_group)
      $browser.img(:alt, Regexp.new(groupType)).when_present(60).click
      $group_name.when_present(60).set("Automated Group Name #{random}")
      group_name_value = $group_name.value
      $group_description.when_present(60).set("Automated Description #{random}")
      sleep 5
      $browser.span(:class => /content/, :text => Regexp.new(groupCategory)).fire_event("onclick")
      sleep 5
      $choose_icon.fire_event("onclick")
      sleep 5
      $create_group.when_present(60).click
      sleep 10
    end
    $skip_button.when_present(60).click
    sleep 5
    begin
      assert $browser.text.include? "#{group_name_value}"
    rescue => e
      puts e
      puts "FAILED! Unable to find Group Name."
    end

  end

  def create_any_new_group(groupType, groupCategory)
    $browser.goto($patch_new_group)
    $browser.img(:alt, Regexp.new(groupType)).when_present(60).click
    $group_name.when_present(60).set("Automated Group Name #{random}")
    group_name_value = $group_name.value
    $group_description.when_present(60).set("Automated Description #{random}")
    sleep 5
    $browser.span(:class => /content/, :text => Regexp.new(groupCategory)).fire_event("onclick")
    sleep 5
    $choose_icon.fire_event("onclick")
    sleep 5
    $create_group.when_present(60).click
    sleep 5
    verify_group_created("Open Group", "Family")
    return group_name_value
  end



  def create_a_group_invite_others_to_join(groupType, groupCategory)
    $browser.goto($patch_new_group)
    $browser.img(:alt, Regexp.new(groupType)).click
    $group_name.set("Automated Group Name #{random}")
    group_name_value = $group_name.value
    $group_description.set("Automated Description #{random}")
    sleep 5
    $browser.span(:class => /content/, :text => Regexp.new(groupCategory)).fire_event("onclick")
    sleep 5
    $choose_icon.fire_event("onclick")
    sleep 5
    $create_group.when_present(60).click
    sleep 5
    $skip_button.when_present(60).click
    sleep 5
    begin
      assert $browser.text.include? "#{group_name_value}"
    rescue => e
      puts e
      puts "CP1T01: FAILED! Unable to find Group Name."
    end
    $invite_to_group.fire_event("onclick")
    sleep 3
    $invite_email.fire_event("onclick")
    sleep 3
    $browser.driver.switch_to.window($browser.driver.window_handles[1])
    $contacts_email.wait_until_present
    $contacts_email.set "#{$user_master_email_2}"
    $contacts_email.wait_until_present(60)
    $contacts_email.set "#{$user_master_email_2}"
    $invite_people.click
    $invite_success.when_present(60).click
    sleep 3
    $browser.driver.switch_to.window($browser.driver.window_handles[0])
    return group_name_value
  end

  def post_to_any_group(parentGroup, childGroup)
    $browser.goto($patch_note)
    sleep 5
    $post_pick_group.when_present(60).click
    sleep 5
    $group_select.when_present(60).select(parentGroup)
    sleep 3
    $browser.link(:text, Regexp.new(childGroup)).when_present(60).click
    $post_compose_note.when_present(60).set("Note field populated by automated test.")
    $post_now.when_present(60).fire_event("onclick")
    sleep 5
  end

  def count_draft_current()
    $count_of_drafts.wait_until_present(60)
    unTrimmedCount = $count_of_drafts.text
    trimmedCount = unTrimmedCount.gsub(/[()]/, "")
    draftNum = trimmedCount.to_i
    return draftNum
  end

  def count_post_current()
    $count_of_published.wait_until_present(60)
    unTrimmedCount = $count_of_published.text
    trimmedCount = unTrimmedCount.gsub(/[()]/, "")
    postNum = trimmedCount.to_i
    return postNum
  end

  def count_scheduled_current()
    $count_of_scheduled.wait_until_present(60)
    unTrimmedCount = $count_of_scheduled.text
    trimmedCount = unTrimmedCount.gsub(/[()]/, "")
    postNum = trimmedCount.to_i
    return postNum
  end

  def count_submitted_draft_current()
    $count_of_submitted_draft.wait_until_present
    unTrimmedCount = $count_of_submitted_draft.text
    trimmedCount = unTrimmedCount.gsub(/[()]/, "")
    postNum = trimmedCount.to_i
    return postNum
  end


  def create_new_draft_if_no_draft_found(parentGroup, childGroup)
    draftCount = count_draft_current
    if  (draftCount < 3)
      i=1
      while i < 3
        $browser.goto($patch_note)
        $post_pick_group.when_present(60).click
        $group_select.when_present(60).select(parentGroup)
        sleep 3
        $browser.link(:text, Regexp.new(childGroup)).click
        $post_compose_note.when_present(60).set("Note field populated by automated test.")
        $post_now_caret.when_present(60).fire_event("onclick")
        $save_as_draft.wait_until_present(60)
        $save_as_draft.when_present(60).click
        $draft_saved_message.wait_until_present(60)
        i=i+1
      end
      go_to_draft_tab_on_your_post_page
    end
  end

  def create_new_draft(parentGroup, childGroup)
    $browser.goto($patch_note)
    $post_pick_group.when_present(60).click
    $group_select.when_present(60).select(parentGroup)
    sleep 3
    $browser.link(:text, Regexp.new(childGroup)).click
    $post_compose_note.when_present(60).set("Note field populated by automated test.")
    $post_now_caret.when_present(60).fire_event("onclick")
    $save_as_draft.wait_until_present(60)
    $save_as_draft.when_present(60).click
    $draft_saved_message.wait_until_present(60)
  end

  def schedule_post(parentGroup, childGroup)
    scheduledPostCount = count_scheduled_current
    if  (scheduledPostCount < 5)
      i=1
      while i < 5
        $browser.goto($patch_note)
        $post_pick_group.when_present(60).click
        $group_select.when_present(60).select(parentGroup)
        $post_compose_note.wait_until_present(60)
        $browser.link(:text, Regexp.new(childGroup)).when_present(60).click
        $post_compose_note.when_present(60).set("Note field populated by automated test.")
        $advanced_options.when_present(60).click
        currentTime = Time.now()
        currentDate = currentTime.strftime("%Y-%m-%d")
        $post_advanced_calendar.when_present(60).set("#{currentDate}")
        $post_advanced_time.when_present(60).select("11:00 PM")
        $post_now.when_present(60).fire_event("onclick")
        sleep 3
        i = i+1
      end
    end
  end

  def publish_post_if_not_found(parentGroup, childGroup)
    postCount = count_post_current
    if  (postCount < 5)
      i=1
      while i < 5
        $browser.goto($patch_note)
        $post_pick_group.when_present(60).click
        $group_select.when_present(60).select(parentGroup)
        sleep 3
        $browser.link(:text, Regexp.new(childGroup)).when_present(60).click
        $post_compose_note.when_present(60).set("Note field populated by automated test.")
        $post_now.when_present(60).fire_event("onclick")
        sleep 3
        i = i+1
      end
    end
  end

  def delete_scheduled_post()
    $profile_delete_on_scheduled_post.when_present(60).click
    $delete_on_delete_this_draft.when_present(60).click
    $browser.refresh
    $count_of_scheduled.wait_until_present(60)
  end

  def verify_scheduled_post_count_updated_after_deleting_scheduled_post()
    go_to_scheduled_tab_on_your_post_page
    scheduledPostCountCurrent = count_scheduled_current
    delete_scheduled_post
    scheduledPostCountAfterDeletingScheduledPost = count_scheduled_current
    assert scheduledPostCountAfterDeletingScheduledPost == scheduledPostCountCurrent - 1
  end

  def go_to_scheduled_tab_on_your_post_page
    $profile_scheduled.when_present(60).click
    $profile_delete_on_scheduled_post.wait_until_present(60)
  end

  def go_to_draft_tab_on_your_post_page
    $profile_account_avatar.when_present(60).click
    $profile_your_posts.when_present(60).click
    $profile_current.wait_until_present(60)
  end

  def go_to_published_tab_on_your_post_page
    $profile_account_avatar.when_present(60).click
    $profile_your_posts.when_present(60).click
    $profile_published.when_present(60).click
    sleep 3
  end


  def comment_on_a_post()
    $leave_comment_textfield.wait_until_present(60)
    $leave_comment_textfield.when_present(60).set "Automated comment text #{random}"
    $group_post_button.when_present(60).click
  end

  def find_a_group(groupName)
    $search_textfield.when_present(60).set "#{groupName}"
    $search_text_button.when_present(60).click
    sleep 5
    begin
      assert $browser.text.include? "#{groupName}"
    rescue => e
      puts e
      puts "CP1T01: FAILED! Unable to find Group "
    end
    $browser.strong(:text => Regexp.new(groupName)).when_present(60).click
    sleep 5
  end

  def follow_a_group
    $follow_a_group.when_present(60).fire_event("onclick")
    $follow_success_text.wait_until_present(60)
    $follow_success_ok_button.when_present(60).click
    sleep 5
  end

  def request_invite
    $request_invite.when_present(60).fire_event("onclick")
    sleep 10
  end

  def approve_as_follower
    $approve_as_follower.when_present(60).fire_event("onclick")
    sleep 5
  end

  def grant_access_as_manager
    begin
      assert $group_settings.exists?
      $group_settings.when_present(60).fire_event("onclick")
    rescue => e
      puts e
      puts "FAILED! Unable to find Group Settings."
    end
    begin
      sleep 5
      assert $group_followers.exists?
      $group_followers.when_present(60).click
    rescue => e
      puts e
      puts "FAILED! Unable to find Followers."
    end
    sleep 5
    verify_text_present("Contributors")
    $group_access_dropdown.when_present(60).click
    $browser.link(:text, /Make a Manager/).when_present(60).click
    sleep 5
  end

  def verify_text_present(expectedText)
    begin
      assert $browser.text.include? "#{expectedText}"
    rescue => e
      puts e
      puts "FAILED! Unable to find '#{expectedText} ' on this page "
    end
  end


  def go_to_any_group(parentGroup, childGroup)
    $browser.goto($patch_group)
    sleep 5
    $browser.span(:text=> Regexp.new(parentGroup), :class => /name/).when_present(60).click
    sleep 5
    $browser.strong(:text=>Regexp.new(childGroup)).when_present(60).click
    sleep 5
  end

  def repost_to_any_group(parentGroup, childGroup)
    $repost_link.when_present(60).click
    sleep 5
    $post_pick_group.when_present(60).click
    sleep 5
    $group_select.when_present(60).select(parentGroup)
    sleep 5
    $browser.link(:text, Regexp.new(childGroup)).when_present(60).click
    sleep 5
    $repost_button.when_present(60).click
    sleep 5
  end

  def read_all_updates
    if $profile_notification_num.exists?
      $profile_updates.when_present(60).click
      $see_all_updates.when_present(60).click
      sleep 5
    end
  end


  def verify_updates
    begin
      assert $profile_notification_num.exists?
    rescue => e
      puts e
      puts "FAILED! Unable to find Updates Bell notification."
    end
  end

  def share_review
    $directory_menu.when_present(60).click
    sleep 5
    $directory_schools.when_present(60).click
    sleep 5
    $directory_schools_first.when_present(60).click
    sleep 5
    $share_review_text_field.when_present(60).click
    sleep 5
    $post_compose_review.when_present(60).set ("Automated review text #{random}")
    sleep 5
    $group_post_button.when_present(60).click
    sleep 5
  end

  def leave_a_comment_on_any_group(parentGroup, childGroup)
    $browser.goto($patch_group)
    sleep 5
    $browser.span(:text=> Regexp.new(parentGroup), :class => /name/).when_present(60).click
    sleep 5
    $browser.strong(:text=>Regexp.new(childGroup)).when_present(60).click
    sleep 5
    if $leave_comment_link2.exists?
      $leave_comment_link2.when_present(60).click
      sleep 5
      $leave_comment_textfield.when_present(60).set "Automated comment text #{random}"
    else
      $leave_comment_textfield.when_present(60).click
      $leave_comment_textfield.when_present(60).set "Automated comment text #{random}"
      sleep 5
    end
    sleep 5
    $group_post_button.when_present(60).click
    sleep 5
  end

  def comment_on_a_post_which__i_commented_before(parentGroup, childGroup)
    $browser.goto($patch_group)
    $browser.span(:text=> Regexp.new(parentGroup), :class => /name/).when_present(60).click
    $browser.strong(:text=>Regexp.new(childGroup)).when_present(60).click
    $leave_comment_textfield.when_present(60).click
    sleep 2
    $leave_comment_textfield.when_present(60).set "Automated comment text #{random}"
    sleep 2
    $group_post_button.when_present(60).click
  end

  def leave_comment_on_share_review_group
    $directory_menu.when_present(60).click
    sleep 5
    $directory_schools.when_present(60).click
    sleep 5
    $directory_schools_first.when_present(60).click
    sleep 5
    if $leave_comment_link.exists?
      $leave_comment_link.when_present(60).click
      $leave_comment_textfield.when_present(60).set "Automated comment text #{random}"
    else
      $leave_comment_textfield.when_present(60).click
      $leave_comment_textfield.when_present(60).set "Automated comment text #{random}"
    end
    sleep 5
    $group_post_button.click
    sleep 5
  end

end