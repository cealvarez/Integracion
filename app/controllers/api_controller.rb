class ApiController < ApplicationController
	def home
		render text: "hello, world!"
	end
end
