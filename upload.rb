require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://the-internet.herokuapp.com/'

driver.find_element(:link_text, "File Upload").click
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

begin
	element = wait.until { driver.find_element(:id, "file-upload") }
	element.send_keys("/Users/udayaggarwal/desktop/selenium/upload.rb")
	driver.find_element(:id, "file-submit").click
	element = driver.find_element(:id, "uploaded-files")
	puts element.text
rescue Exception => ex
	puts "Handling error"
	puts ex.message
ensure
	puts "quitting driver"
	driver.quit
end