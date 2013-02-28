require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'

class TestManageGroups < UserVariables

  include Common_Methods
  include Profile_Common
  include Manage_Groups

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

#Test 25851: Verify expected UI of the Manage Group
  def test_ID_25851_ui_of_the_manage_group
    login_as_user1
    go_to_edit_profile_page
    verify_elements_left_nav "test_ID_25851_ui_of_the_manage_group"
    $profile_manage_groups.when_present(60).click
    sleep 5
    verify_text "test_ID_25851_ui_of_the_manage_group", "Manage Groups", "Email Settings", "Following", "Followers", "Posts"
    verify_elements_on_manage_groups_page "test_ID_25851_ui_of_the_manage_group"
    group_icon_redirect
    click_group_name_verify_redirect "editors-picks"
    email_settings_redirect
    following_button_to_unfollow_and_follow
    #verify_the_links_on_the_side_bar_of_manage_groups "test_ID_25851_ui_of_the_manage_group"
  end

#Test 25852: Drag and drop the groups and verify groups rearranged
# This test doesn't cover manual test completely as to determine and drag and drop need more research
  def atest_ID_25852_rearranging_group

  end

#Test 25853: Verify expected UI of the Manage Group
  def atest_ID_25853_manage_groups_ui
   #This test is covered by  : test_ID_25851_ui_of_the_manage_group
  end

#Test 25854: Manage Groups
  def atest_ID_25853_manage_groups
    #This test is covered by : test_ID_25851_ui_of_the_manage_group
  end

#Test 25855: Verify the links on the side bar of Manage Group
  def atest_ID_25855_verify_the_links_on_the_side_bar_of_manage_groups
    #This test is covered by : test_ID_25851_ui_of_the_manage_group
  end

end  # end of class