require "./main.rb"

driver, wait = Main.start
driver.find_element(:link_text, "File Upload").click

begin
	element = wait.until { driver.find_element(:id, "file-upload") }
	element.send_keys("/Users/udayaggarwal/desktop/selenium/hover.rb")
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