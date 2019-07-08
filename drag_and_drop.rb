require "./main.rb"

driver, wait = Main.start
driver.find_element(:link_text, "Drag and Drop").click

begin
	from = wait.until { driver.find_element(:id, "column-a") }
	to = driver.find_element(:id, "column-b")
	driver.action.click_and_hold(from).perform
	driver.action.move_to(to).perform
	driver.action.release.perform
rescue Exception => ex
	puts "Handling error"
	puts ex.message
ensure
	puts "Quitting driver"
	driver.quit
end