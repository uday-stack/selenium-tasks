require "./main.rb"

COLUMN_A = "column-a"
COLUMN_B = "column-b"

driver, wait = Main.start
driver.find_element(:link_text, "Drag and Drop").click

begin
	from = wait.until { driver.find_element(:id, COLUMN_A) }
	to = driver.find_element(:id, COLUMN_B)
	driver.action.click_and_hold(from).perform
	driver.action.move_to(to).perform
	driver.action.release.perform
rescue Exception => ex
	puts Main::ERROR_MSG
	puts ex.message
ensure
	puts Main::DRIVER_QUIT
	driver.quit
end