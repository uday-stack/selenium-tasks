require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://the-internet.herokuapp.com'

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
driver.find_element(:link_text, "Dynamic Loading").click

begin
	driver.find_element(:partial_link_text, "Example 1").click
	driver.find_element(:css, "#start button").click
	first_hello = wait.until { driver.find_element(:css, "#finish h4") }
	puts first_hello.text
	driver.navigate.back
	driver.find_element(:partial_link_text, "Example 2").click
	driver.find_element(:css, "#start button").click
	second_hello = wait.until { driver.find_element(:css, "#finish h4") }
	puts second_hello.text
rescue Exception => ex
	puts "Handling error"
	puts ex.message
ensure
	puts "Quitting driver"
	driver.quit
end
