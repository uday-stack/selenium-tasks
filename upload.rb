require "./main.rb"

UPLOAD = "file-upload"
FILE_PATH = "/Users/udayaggarwal/desktop/selenium/hover.rb"
SUBMIT = "file-submit"
RESULT = "uploaded-files"

driver, wait = Main.start
driver.find_element(:link_text, "File Upload").click

begin
	element = wait.until { driver.find_element(:id, UPLOAD) }
	element.send_keys(FILE_PATH)
	driver.find_element(:id, SUBMIT).click
	element = driver.find_element(:id, RESULT)
	puts element.text
rescue Exception => ex
	puts Main::ERROR_MSG
	puts ex.message
ensure
	puts Main::DRIVER_QUIT
	driver.quit
end