require "./main.rb"

EXAMPLE_1 = "Example 1"
EXAMPLE_2 = "Example 2"
BUTTON = "#start button"
HELLO = "#finish h4"

driver, wait = Main.start
driver.find_element(:link_text, "Dynamic Loading").click

begin
	driver.find_element(:partial_link_text, EXAMPLE_1).click
	driver.find_element(:css, BUTTON).click
	first_hello = wait.until { driver.find_element(:css, HELLO) }
	puts first_hello.text
	driver.navigate.back
	driver.find_element(:partial_link_text, EXAMPLE_2).click
	driver.find_element(:css, BUTTON).click
	second_hello = wait.until { driver.find_element(:css, HELLO) }
	puts second_hello.text
rescue Exception => ex
	puts Main::ERROR_MSG
	puts ex.message
ensure
	puts Main::DRIVER_QUIT
	driver.quit
end
