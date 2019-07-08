require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get 'https://the-internet.herokuapp.com'

wait = Selenium::WebDriver::Wait.new(:timeout => 10)
driver.find_element(:link_text, "JavaScript Alerts").click

begin
	driver.find_element(:xpath, '//button[text()="Click for JS Alert"]').click
	alert = driver.switch_to.alert
	alert.accept
	puts driver.find_element(:id, "result").text
	driver.find_element(:xpath, '//button[text()="Click for JS Confirm"]').click
	alert = driver.switch_to.alert
	alert.dismiss
	puts driver.find_element(:id, "result").text
	driver.find_element(:xpath, '//button[text()="Click for JS Prompt"]').click
	alert = driver.switch_to.alert
	alert.send_keys "hahaha"
	alert.accept
	puts driver.find_element(:id, "result").text
rescue Exception => ex
	puts "Handling error"
	puts ex.message
ensure
	puts "Quitting driver"
	driver.quit
end