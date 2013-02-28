require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'

class TestPersonalInfo < UserVariables

  include Common_Methods
  include Profile_Common
  include Personal_Info

  def setup
    #Access join page
    super
    $browser.goto($patch_login)
  end


##########
##Tests!##
##########

#Test 25856: Valid Email saved, wrong formatted email shows error message
  def atest_ID_25856_personal_info_email()
    login_as_user1
    go_to_edit_profile_page
    $profile_personal.when_present(60).click
    sleep 5
    verify_elements_on_personal_info_page "test_ID_25856_personal_info_email"
    verify_text "test_ID_25856_personal_info_email", "Personal Info"
    verify_expected_email_id_shown_in_email_field $user_master_email
    verify_valid_email_saved
    verify_error_message_for_incorrect_email
  end

#Test 25857: Valid phone saved
  def test_ID_25857_personal_info_phone()
    login_as_user1
    go_to_edit_profile_page
    $profile_personal.when_present(60).click
    sleep 5
    verify_phone_saved
    verify_error_message_for_phone
  end

#Test 25858: User gets prompt to enter password before proceeding to change the details
  def atest_ID_25858_personal_info_password()
    login_as_user1
    go_to_edit_profile_page
    $profile_personal.when_present(60).click
    sleep 5
    verify_save_button_disabled_until_password_entered
    change_email_id_verify_user_gets_prompt_to_enter_password
    change_phone_verify_user_gets_prompt_to_enter_password
    enter_wrong_password_verify_error_message
    retain_original_email_id
  end

#Test 25859: Verify cancel reverted changes
  def atest_ID_25859_personal_info_cancel()
    login_as_user1
    go_to_edit_profile_page
    $profile_personal.when_present(60).click
    sleep 5
    verify_cancel_reverted_changes_personal_info
  end

end


