require "./main.rb"

FILE_NAME = "Desert.jpg"

driver, wait = Main.start
driver.find_element(:link_text, "File Download").click

begin
	element = wait.until { driver.find_element(:link_text, FILE_NAME) }
	element.click
	sleep(5)
	puts element.text
rescue Exception => ex
	puts Main::ERROR_MSG
	puts ex.message	
ensure
	puts Main::DRIVER_QUIT
	driver.quit
end
