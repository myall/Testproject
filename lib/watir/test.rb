require 'test/unit'
require 'singleton'
require 'yaml' 

class Browser
  include Singleton

  attr_accessor :driver

  WEB_DRIVER_VAR = {
    'firefox' => 'Selenium::WebDriver::Firefox',
    'chrome'  => 'Selenium::WebDriver::Chrome',
    'ie'      => 'Selenium::WebDriver::IE'
  }  

  WEBDRIVER_CLASS = {
    'ie'      => lambda { Watir::Browser.new :ie },
    'firefox' => lambda { Watir::Browser.new :firefox },
    'opera'   => lambda { Watir::Browser.new :opera },
    'safari'  => lambda { Watir::Browser.new :safari },
    'chrome'  => lambda { Watir::Browser.new :chrome }
  }

  def initialize
    config_version = ENV['BROWSER_VERSION']
    config_browser = ENV['BROWSER'] || 'firefox'

    if config_browser == 'safari'
      require 'safariwatir'
    else 
      require 'watir-webdriver'
      require 'watir-webdriver-performance'
    end
 
    if config_version
      webdriver_variable = WEB_DRIVER_VAR[config_browser]
       
      browsers   = YAML::load_file('config/browser.yml')
      executable = browsers[config_browser][config_version]
      raise "#{config_version} not supported for #{browser} in config/browser.yml" unless executable

      eval "#{webdriver_variable}.path = File.expand_path('#{executable}')"
    end
   
    self.driver = WEBDRIVER_CLASS[config_browser].call

    at_exit do
      self.driver.close
    end
  end
end

class WatirTest < Test::Unit::TestCase
  attr_accessor :driver

  def quiet
    self.instance_eval do
      begin
        yield 
      rescue => e
        print e
      end
    end
  end

$environment = "nixon.i"
$flatiron_patch = "Flatiron." #This should only be used for group settings tests
$local_patch = "Bellmore."
#$user_master_email = "qa_automation+user+1@patch.com"
#$user_master_email_2 = "qa_automation+user+2@patch.com"
$user_master_email = "asad.zaman+nixon1@patch.com"
$user_master_email_2 = "asad.zaman+nixon2@patch.com"
$user_master_email_3 = "qa_automation+user+3@patch.com"
$user_master_password = "passwordautomated1!!"
$post_media_username = "/Users/mellissamcconnell/"

  def setup
    self.driver = Browser.instance.driver
  end
end
