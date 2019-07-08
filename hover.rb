require 'rubygems'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
driver.get "https://the-internet.herokuapp.com/"


driver.find_element(:link_text, "Hovers").click
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

begin
	element = driver.find_elements(:class,'figure')
end

element.each { |item| 
	driver.action.move_to(item).perform
	puts item.text
}

sleep(5)

driver.quit