require "./main.rb"

driver, wait = Main.start
driver.find_element(:link_text, "Hovers").click

begin
	element = driver.find_elements(:class,'figure')
end

element.each { |item| 
	driver.action.move_to(item).perform
	puts item.text
}

sleep(5)

driver.quit