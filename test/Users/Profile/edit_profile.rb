require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'

class TestEditProfile < UserVariables

  include Common_Methods
  include Profile_Common
  include Edit_Profile

  def setup
    #Access join page
    super
    $browser.goto($patch_login)
  end

##########
##Tests!##
##########


#Test 25826: User Profile Edit
  def test_ID_25826_user_profile_edit()
    login_as_user1
    go_to_edit_profile_page
    verify_text "test_ID_25826_user_profile_edit", "Edit Profile"
    verify_elements_left_nav "test_ID_25826_user_profile_edit"
    $profile_personal.when_present(60).click
    sleep 3
    verify_text "test_ID_25826_user_profile_edit","Personal Info"
    $profile_updates_side_link.when_present(60).click
    sleep 3
    verify_text "test_ID_25826_user_profile_edit","Pending Updates"
    $profile_your_posts.when_present(60).click
    sleep 3
    verify_text "test_ID_25826_user_profile_edit","Your Posts"
    $profile_manage_groups.when_present(60).click
    sleep 3
    verify_text "test_ID_25826_user_profile_edit","Manage Groups"
    $profile_email_settings.when_present(60).click
    sleep 3
    $profile_save_changes.wait_until_present(60)
    verify_text "test_ID_25826_user_profile_edit","Email Settings"
    $view_profile.click
    sleep 3
    verify_text "test_ID_25826_user_profile_edit","Managed Groups","Posts","Following","Comments","Manager Of","Recent Activity","Manager Of","created group", "ago","is now a manager of", "is now a contributor to","is following","posted in"
  end

#Test 25826: Verify left nav all elements present
  def atest_ID_25827_user_profile_private_left_nav()
    # this test is already covered by test_ID_25826_user_profile_edit
  end

#Test 25828: Verify after view link clicked it points to correct page
  def atest_ID_25828_user_profile_edit_view_profile()
    # this test is already covered by test_ID_25826_user_profile_edit
  end

#Test 25829: Verify after edit link clicked it points to correct page
  def atest_ID_25829_user_profile_edit_profile()
    # this test is already covered by test_ID_25826_user_profile_edit
  end

#Test 25830: Verify after personal info link clicked it points to correct page
  def atest_ID_25830_user_profile_edit_personal_info()
    # this test is already covered by test_ID_25826_user_profile_edit
  end

#Test 25831: Verify after updates link clicked it points to correct page
  def atest_ID_25831_user_profile_edit_updates()
    # this test is already covered by test_ID_25826_user_profile_edit
  end

#Test 25832: Verify after edit your posts link clicked it points to correct page
  def atest_ID_25832_user_profile_edit_your_posts()
    # this test is already covered by test_ID_25826_user_profile_edit
  end

#Test 25833: Verify after Manage Groups link clicked it points to correct page
  def atest_ID_25833_user_profile_edit_manage_groups()
    # this test is already covered by test_ID_25826_user_profile_edit
  end

#Test 25834: Verify after email settings link clicked it points to correct page
  def atest_ID_25834_user_profile_edit_email_settings()
    # this test is already covered by test_ID_25826_user_profile_edit
  end
end   # end of Class