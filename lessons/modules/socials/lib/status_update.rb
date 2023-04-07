# ./status_update.rb
require './lib/commentable'

class StatusUpdate
	include Commentable
	attr_reader :body, :comments

	def initialize(body)
		@body = body
		@comments = {}
	end

	def display
		display_string = "-" * 50 + "\n"
		display_string += "STATUS UPDATE" + "\n"
		display_string += "Body: #{body}" + "\n"
		comments.each do |id, text|
			display_string += "#{id}: #{text}" + "\n"
		end
		display_string += "-" * 50
	end

	
end
