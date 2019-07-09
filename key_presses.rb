require "./main.rb"

TARGET = "target"

driver, wait = Main.start
element = driver.find_element(:link_text, "Key Presses").click

element = driver.find_element(:id, TARGET)
a = 65.chr
for i in (1..255)
	element.send_keys(a.next!)
	ans = driver.find_element(:id, RESULT).text
	puts ans
end

driver.quit