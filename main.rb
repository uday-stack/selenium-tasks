module Main
	def Main.start
		require 'rubygems'
		require 'selenium-webdriver'

		driver = Selenium::WebDriver.for :chrome
		driver.get 'https://the-internet.herokuapp.com/'
		wait = Selenium::WebDriver::Wait.new(:timeout => 10)
		return driver, wait
	end
end