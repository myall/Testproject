require 'watir/test'
require 'Users/user_variables'
require 'Utility/profile_common'
require 'Utility/common_methods'



class TestUpdates < UserVariables

  include Common_Methods
  include Profile_Common
  include Updates
  include Create_New_Group


  def setup
    #Access join page
    super
    $browser.goto($patch_login)
  end


##########
##Tests!##
##########

#Test 25860: View Updates
  def test_ID_25860_view_updates()
    login_as_user1
    go_to_updates_page
    verify_text "test_ID_25860_view_updates", "Pending Updates", "All Updates"
  end

#Test 25861: Suspended user  - notification
  def atest_ID_25861_suspended_user_notification()
     # Need suspended account
  end

#Test 25862: New post in group you manage
  def test_ID_25862_new_post_in_group_you_manage()
    login_as_user1
    read_all_updates
    groupName = create_any_new_group("Open Group", "Family")
    logout_common
    login_as_user2
    post_to_any_group("Family",groupName)
    logout_common
    login_as_user1
    verify_updates
  end

#Test 25863: Comment on review
  def test_ID_25863_comment_on_review()
    login_as_user1
    read_all_updates
    share_review
    logout_common
    login_as_user2
    leave_comment_on_share_review_group
    logout_common
    login_as_user1
    verify_updates
  end

#Test 25864: Reposted review
  def atest_ID_25863_reposted_review()
     # Need clarification
  end

#Test 25866: Comment on post you wrote
  def test_ID_25866_comment_on_post_you_wrote()
    login_as_user1
    post_to_any_group("Living","House & Home")
    logout_common
    login_as_user2
    leave_a_comment_on_any_group("Living","House & Home")
    logout_common
    login_as_user1
    verify_updates()
  end

#Test 25867: Repost
  def test_ID_25867_repost()
    login_as_user1
    read_all_updates
    post_to_any_group("Living","House & Home")
    logout_common
    login_as_user2
    read_all_updates
    go_to_any_group("Living","House & Home")
    repost_to_any_group("News","Health")
    logout_common
    login_as_user1
    verify_updates()
  end

#Test 25868: Comments on a post I commented on
  def test_ID_25868_comments_on_a_post_i_commented_on()
    login_as_user1
    post_to_any_group("Living","House & Home")
    comment_on_a_post
    logout_common
    login_as_user2
    comment_on_a_post_which__i_commented_before("Living","House & Home")
    logout_common
    login_as_user1
    verify_updates
  end

#Test 25869: User requests to follow a private group
  def test_ID_25869_user_requests_to_follow_a_private_group()
    login_as_user1
    read_all_updates
    groupName = create_any_new_group("Open Group", "News")
    logout_common
    login_as_user2
    find_a_group("#{groupName}")
    follow_a_group
    logout_common
    login_as_user1
    verify_updates
  end

#Test 25870: Access granted as Manager
  def test_ID_25870_invitation_to_follow()
    login_as_user1
    read_all_updates
    create_a_group_invite_others_to_join("Open Group", "News")
    logout_common
    login_as_user2
    verify_updates
  end

#Test 25871: Access granted as Manager
  def test_ID_25871_access_granted_as_manager()
    login_as_user1
    read_all_updates
    groupName = create_a_group_invite_others_to_join("Open Group", "News")
    logout_common
    login_as_user2
    verify_updates
    find_a_group("#{groupName}")
    follow_a_group
    logout_common
    login_as_user1
    verify_updates
    find_a_group("#{groupName}")
    grant_access_as_manager
    logout_common
    login_as_user2
    verify_updates
  end


#Test 25872: Access granted as a contributor
  def atest_ID_25872_access_granted_as_contributor()
    #Need to be clarified. Looks like it's already covered with access_granted_as_manager()
  end


#Test 25873: Access granted as follower of a private group
  def test_ID_25873_access_granted_as_follower_of_a_private_group()
    login_as_user1
    read_all_updates
    groupName = create_any_new_group("Private", "News")
    logout_common
    login_as_user2
    read_all_updates
    find_a_group("#{groupName}")
    request_invite
    logout_common
    login_as_user1
    verify_updates
    go_to_updates_page
    approve_as_follower
    logout_common
    login_as_user2
    verify_updates
  end

#Test 25874: User follows a group -you Manage
  def test_ID_25874_user_follows_a_group_you_manage()
    login_as_user1
    read_all_updates
    groupName = create_any_new_group("Open Group", "News")
    logout_common
    login_as_user2
    read_all_updates
    find_a_group("#{groupName}")
    follow_a_group
    logout_common
    login_as_user1
    verify_updates
  end


end  # end of Class

