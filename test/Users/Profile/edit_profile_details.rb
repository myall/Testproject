require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'

class TestEditProfileDetails < UserVariables

  include Common_Methods
  include Profile_Common
  include Edit_Profile_details

  def setup
    #Access join page
    super
    $browser.goto($patch_login)
  end

##########
##Tests!##
##########

#Test 25835: Verify after email settings link clicked it points to correct page
  def test_ID_25835_edit_profile_desc
    login_as_user1
    go_to_edit_profile_page
    verify_elements_left_nav "test_ID_25835_edit_profile_desc"
    verify_elements_on_edit_profile "test_ID_25835_edit_profile_desc"
  end

#Test 25836: Verify Profile picture - original / default
  def test_ID_25836_edit_profile_pic
    login_as_user1
    go_to_edit_profile_page
    verify_valid_profile_pic_uploaded "valid"
    verify_unable_to_upload_non_image_file "PDFDocument"
    verify_user_able_to_close_photo_upload_dialog
    verify_user_able_to_cancel_photo_upload_dialog
  end

#Test 25837: Profile name populated
  def test_ID_25837_edit_profile_name
    login_as_user1
    go_to_edit_profile_page
    verify_user_name_populated_on_name_textfield "test_ID_25837_edit_profile_name", "Jamie Smith"
  end

#Test 25838: Other option selected by default, Gender has also Male option followed by Female option
  def test_ID_25838_edit_profile_gender
    login_as_user1
    go_to_edit_profile_page
    verify_gender_shown_other_as_default "test_ID_25835_edit_profile_desc"
    verify_gender_has_male_followed_by_female_option "test_ID_25835_edit_profile_desc"
    verify_gender_change_is_saved "Male","Female","Other"
  end

#Test 25839: Verify default home town is shown and can be saved other home town option
  def test_ID_25839_edit_profile_home_patch
    login_as_user1
    go_to_edit_profile_page
    verify_users_default_town_name_displayed_as_home_patch "test_ID_25835_edit_profile_desc" , "Bellmore Patch"
    verify_hometown_change_is_saved "Bellmore Patch","Garden City Patch"
  end

#Test 25840: Verify day can be selected 1 to 31, Month from Jan to Dec and Year from 1900 to the current year
  def test_ID_25840_edit_profile_resident_since
    login_as_user1
    go_to_edit_profile_page
    verify_day_can_only_be_selected_from_1_to_31 "test_ID_25835_edit_profile_desc", 1, 31
    verify_month_can_only_be_selected_from_Jan_to_Dec "test_ID_25835_edit_profile_desc", 1, 12
    time = Time.new
    verify_year_can_only_be_selected_from_1900_to_current_year "test_ID_25835_edit_profile_desc", "1900", "#{time.year}"
    verify_user_can_save_date "March","18","1981"
    verify_user_can_return_date_to_the_default "Month","Day","Year"
    verify_user_is_not_able_to_specify_only_the_month_drop_down "March","Day","Year"
    verify_user_is_not_able_to_specify_only_the_day_drop_down "Month","12","Year"
    #verify_user_is_not_able_to_specify_only_the_year_drop_down "Month","Day","1970" Bug
  end

#Test 25841: Verify text can be entered, saved, then deleted and saved (field remains optional)
  def test_ID_25841_edit_profile_i_am_a_optional
    login_as_user1
    go_to_edit_profile_page
    verify_i_am_a_text_optional
    verify_text_can_be_entered_saved_on_i_am_a_textfield
  end

#Test 25842: Verify text can be entered, saved, then deleted and saved (field remains optional)
  def test_ID_25842_edit_profile_a_little_more_about_me
    login_as_user1
    go_to_edit_profile_page
    verify_little_more_about_me_text_optional
    verify_text_can_be_entered_saved_on_little_more_about_me
  end

#Test 25843: Verify text can be entered, saved, then deleted and saved (field remains optional)
  def test_ID_25843_edit_profile_what_i_love_about_your_town
    login_as_user1
    go_to_edit_profile_page
    verify_little_more_about_my_community
    verify_text_can_be_entered_saved_on_about_my_community
  end

#Test 25844: Verify cancel reverted changes and user remains in the same page
  def test_ID_25844_edit_profile_cancel_reverted_changes
    login_as_user1
    go_to_edit_profile_page
    verify_cancel_reverted_changes_edit_profile "test_ID_25835_edit_profile_desc"
  end

#Test 25845: Jira tickets
  def atest_ID_25845_edit_profile_edit_profile_details
    # Need clarification
  end

#Test 25846: Verify Name with special character and html tag is saved
  def test_ID_25846_edit_profile_name_validation
    login_as_user1
    go_to_edit_profile_page
    verify_name_change_is_saved "test_ID_25835_edit_profile_desc", "Jamie Smith", "Temp name"
    verify_name_validation "test_ID_25835_edit_profile_desc", "Jamie Smith", "%$#%<html>"
  end

#Test 25847: User names are not required to be unique
  def test_ID_25847_edit_profile_name_limit
    login_as_user1
    go_to_edit_profile_page
    verify_user_names_are_not_required_to_be_unique "Jame Smith"
  end

end # end of Class