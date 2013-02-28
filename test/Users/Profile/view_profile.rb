require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'

class TestViewProfile < UserVariables

  include Common_Methods
  include Profile_Common
  include View_Profile

  def setup
    #Access join page
    super
    $browser.goto($patch_login)
  end

####################
##Smoke Test File!##
#################### 

##########
##Tests!##
##########

#Test 25875: Verify view profile elements
  def test_ID_25875_user_profile_additional_fields
    login_as_user1
    go_to_edit_profile_page
    $view_profile.when_present(60).click
    sleep 5
    verify_elements_on_view_profile_page "test_ID_25875_user_profile_additional_fields"
    verify_text "test_ID_25875_user_profile_additional_fields",  "Automation Tester","Managed Groups", "Posts", "Following", "Comments", "Recent Activity"
    verify_stats_appear "test_ID_25875_user_profile_additional_fields", "Managed Groups", "Posts", "Following", "Comments"
    $profile_show_more.when_present(60).click
    verify_text "test_ID_25875_user_profile_additional_fields", "Recent Activity", "posted in", "created group", "is now a manager of", "is now a contributor to", "is following", "ago"
  end

#Test 25876: Verify elements on Edit Profile page
  def atest_ID_25876_edit_user_profile_ui
    #This test is covered on edit_profile
  end

#Test 25877: Guest user view profile
  def test_ID_25877_profile_public_as_guest
    guest_user
    click_on_any_group_as_guest "Police"
    $group_for_guest_user.when_present(60).click
    sleep 5
    verify_text "test_ID_25877_profile_public_as_guest","Managed Groups", "Posts", "Following", "Comments", "Recent Activity"
    verify_edit_button_not_exist
    click_group_icon_verify_redirect "food-and-drink"
    click_group_name_verify_redirect "food-and-drink"
    click_follow_verify_redirect
  end

#Test 25878: Verify Edit button doesn't exists on Profile when guest user views
  def atest_ID_25878_profile_page
      # this test covered by test_ID_25877_profile_public_as_guest
  end

#Test 25879: Users avatar is seen default or original
  def atest_ID_25879_profile_page_avatar
      # This is visibility test not possible by automated test script
  end

#Test 25880: Verify stats appear on profile page
  def atest_ID_25880_profile_page_user_stats
    # this test covered by test_ID_25875_user_profile_additional_fields
  end

#Test 25881: Verify Public groups count
  def atest_ID_25881_profile_page_group_managed
    # Need to research more on how to automate. Partly covered by verify_stats_appear
  end

#Test 25882: Verify public groups following count
  def atest_ID_25882_profile_page_groups_following
    # Need to research more on how to automate. Partly covered by verify_stats_appear
  end

#Test 25883: Verify public groups post count
  def atest_ID_25883_profile_page_posts
    # Need to research more on how to automate. Partly covered by verify_stats_appear
  end

#Test 25884: Verify public groups comments count
  def atest_ID_25884_profile_page_comments
    # Need to research more on how to automate. Partly covered by verify_stats_appear
  end

#Test 25885: Verify user vital info is present on profile page
  def atest_ID_25885_profile_page_user_vitals
    # this test is covered by test_ID_25875_user_profile_additional_fields
  end

#Test 25886: Access granted as follower of a private group
  def atest_ID_25886_profile_page_recent_activity
    # this test is covered by test_ID_25875_user_profile_additional_fields
  end

end    # end of Class


