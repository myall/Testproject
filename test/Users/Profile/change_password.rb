require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'


class TestChangePassword < UserVariables

  include Common_Methods
  include Profile_Common
  include Change_Password_Methods


  def setup
    #Access join page
    super
    $browser.goto($patch_login)
  end

##########
##Tests!##
##########

#Test 25824: Change password and verify expected page elements exists
  def test_ID_25824_change_password()
    login_as_user1
    go_to_change_password_page
    verify_elements_exists_on_change_password_page "test_ID_25824_change_password"
    verify_text "test_ID_25824_change_password", "Change your Password", "Old password" , "New password", "Confirm password"
    change_password_original_to_temp $user_master_password, "tempPassword123"
    save_password_changes
    logout_common
    verify_password_changed
    retain_original_password $user_master_password, "tempPassword123"
    save_password_changes
    verify_cancel_reverted_password_change
  end

#Test 25825: Check invalid password shows error
  def test_ID_25825_invalid_password()
    login_as_user1
    go_to_change_password_page
    verify_elements_exists_on_change_password_page "test_ID_25825_invalid_password"
    verify_text "test_ID_25824_change_password", "Change your Password", "Old password" , "New password", "Confirm password"
    verify_save_button_not_enabled $user_master_password, "newValidPass", "unMatchedPass"
    verify_save_button_enabled $user_master_password, "newValidPass", "unMatchedPass"
    make_sure_your_passwords_match $user_master_password, "newValidPass", "unMatchedPass"
    enter_wrong_old_password "pass11"
    verify_text "test_ID_25825_invalid_password", "Password incorrect"
    enter_new_password_less_than_seven_char "pass"
    verify_text "test_ID_25825_invalid_password", "Please check for errors", "Must be at least 7 characters"
  end


end  # end of Class