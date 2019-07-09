require "./main.rb"

driver, wait = Main.start
driver.find_element(:link_text, "JavaScript Alerts").click

begin
	buttons = driver.find_elements(:tag_name, "button")
	buttons[0].click
	alert = driver.switch_to.alert
	alert.accept
	puts driver.find_element(:id, Main::RESULT).text
	buttons[1].click
	alert = driver.switch_to.alert
	alert.dismiss
	puts driver.find_element(:id, Main::RESULT).text
	buttons[2].click
	alert = driver.switch_to.alert
	alert.send_keys "hahaha"
	alert.accept
	puts driver.find_element(:id, Main::RESULT).text
rescue Exception => ex
	puts Main::ERROR_MSG
	puts ex.message
ensure
	puts Main::DRIVER_QUIT
	driver.quit
end