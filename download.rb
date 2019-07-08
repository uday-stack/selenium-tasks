require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://the-internet.herokuapp.com'

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
driver.find_element(:link_text, "File Download").click

begin
	element = wait.until { driver.find_element(:link_text, "Desert.jpg") }
	element.click
	sleep(5)
	puts element.text
rescue Exception => ex
	puts "Handling error"
	puts ex.message	
ensure
	puts "quitting the driver"
	driver.quit
end
