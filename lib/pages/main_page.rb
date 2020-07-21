class MainPage
  include PageObject

	def go_to_google
			@browser.goto 'www.google.com'
		sleep 10
	end
end
