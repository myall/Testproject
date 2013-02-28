require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'

class TestYourPost < UserVariables

  include Common_Methods
  include Profile_Common
  include Your_Post
  include Create_New_Group

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

#Test 25889: Draft count updated when draft created, deleted or posted
  def atest_ID_25889_current_drafts
    login_as_user1
    go_to_edit_profile_page
    $profile_your_posts.click
    sleep 5
    create_new_draft_if_no_draft_found("Living","House & Home")
    verify_text "test_ID_25889_current_drafts","Your Posts","Drafts", "Scheduled", "Published","Submitted Drafts ","Saved"
    verify_elements_on_current_drafts "test_ID_25889_current_drafts"
    go_to_draft_page
    verify_draft_count_updated_after_creating_new_draft
    verify_post_and_draft_count_updated_after_draft_posted
    verify_draft_count_updated_after_deleting_draft
  end

#Test 25890: Verify Published post count present, updated after deleting post
  def atest_ID_25890_published_posts
    login_as_user1
    go_to_edit_profile_page
    $profile_your_posts.click
    sleep 5
    publish_post_if_not_found("Living","House & Home")
    go_to_published_tab_on_your_post_page
    verify_text "test_ID_25890_published_posts","Your Posts","Drafts", "Scheduled", "Published","Submitted Drafts ","Published"
    verify_elements_on_published_post "test_ID_25890_published_posts"
    verify_published_post_count_updated_after_deleting_post
  end

#Test 25891: Verify scheduled posts exists
  def atest_ID_25891_scheduled_posts
    login_as_user1
    go_to_edit_profile_page
    $profile_your_posts.click
    sleep 5
    schedule_post("Living","House & Home")
    go_to_scheduled_tab_on_your_post_page
    verify_text "test_ID_25890_published_posts","Your Posts","Current Drafts", "Scheduled Posts", "Published Posts", "Scheduled"
    verify_elements_on_scheduled_post "test_ID_25891_scheduled_posts"
    verify_scheduled_post_count_updated_after_deleting_scheduled_post
  end

end

