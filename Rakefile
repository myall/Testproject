require "rubygems"
require "bundler/setup"
require 'yaml'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.name = "all"
  t.test_files = FileList['test/**/*.rb']
  t.verbose = true
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.name = "smoke"
  t.test_files = FileList[
"test/Groups/Group_Settings/group_search_1.rb",
"test/Groups/Group_Open/group_open_1.rb",
"test/Groups/Group_Blog/group_blog_1.rb",
"test/Groups/Group_Private/group_private_1.rb",
"test/Groups/Group_Settings/group_settings_6.rb",
"test/Users/Profile/email_settings.rb",
"test/Directory/Directory_Listing/listing_1.rb",
"test/Directory/Directory_Listing/review_1.rb",
"test/Directory/Directory_Listing/review_4.rb",
"test/Directory/Directory_General/directory_1.rb",
"test/Directory/Directory_General/directory_2.rb",
"test/Groups/Group_Settings/group_search_2.rb",
"test/Groups/Group_Settings/group_search_3.rb",
"test/Groups/Group_Settings/group_settings_4.rb",
"test/Groups/Group_Settings/group_settings_5.rb",
"test/Users/Profile/manage_groups.rb",
"test/Directory/Directory_Listing/listing_3.rb",
"test/Posts/Post_Draft/post_draft_1.rb",
"test/Posts/Post_Publish_Later/post_publish_later_1.rb",
"test/Posts/Post_Draft/post_draft_2.rb",
"test/Posts/Post_General/posts_5.rb",
"test/Posts/Post_General/posts_6.rb",
"test/Posts/Post_General/posts_7.rb",
"test/Posts/Post_Draft/post_draft_3.rb",
"test/Posts/Post_Publish_Later/post_publish_later_11.rb",
"test/Posts/Post_Publish_Later/post_publish_later_12.rb",
"test/Users/Profile/your_post.rb",
"test/Posts/Post_Repost/reposts_1.rb",
"test/Posts/Calendar/calendar_1.rb",
"test/Posts/Post_Inline_Posting/inline_posting_1.rb",
"test/Posts/Post_Inline_Posting/inline_posting_3.rb",
"test/Posts/Post_Inline_Posting/inline_posting_5.rb",
"test/Posts/Post_Repost/reposts_7.rb",
"test/Posts/Post_Repost/reposts_8.rb",
"test/Posts/Post_General/post_search_2.rb",
"test/Posts/Post_General/post_search_1.rb",
"test/Users/Join/join_1.rb",
"test/Users/Profile/view_profile.rb",
"test/Users/Login/login_2.rb",
"test/Groups/Group_Settings/group_search_1.rb"
]
  t.verbose = true
end

namespace :setup do
  desc "Assists in multiple version, browser setup"
  task :browsers do
    if is_mac?
      cp 'config/browser.mac.yml', 'config/browser.yml'
      path = File.expand_path("~/.watir/browsers")
      mkdir_p path
      sh "git submodule init"
      sh "git submodule update browsers/mac"

      system "open #{path}"
      puts "Installing browsers"

      browsers = Dir.glob(File.join(File.dirname(__FILE__), 'browsers/mac', '*.tgz'))
      browsers.each do |file|
        sh "tar -xzvf #{file} -C ~/.watir/browsers"
      end

    elsif is_windows?
      cp 'config/browser.windows.yml' 'config/browser.yml'
    else  
      abort
    end  

    browsers = YAML::load_file('config/browser.yml')

    puts "Install or shortcut/symlink (mac) your browsers here:" 
    browsers.keys.each do |browser|
      browsers[browser].keys.each do |version|
        puts "#{browser} #{version}: #{browsers[browser][version].sub(/\.app.*/,'')}"
      end
    end
  end
end

def is_mac?
  RUBY_PLATFORM.downcase.include?("darwin")
end

def is_windows?
   RUBY_PLATFORM.downcase.include?("mswin")
end
