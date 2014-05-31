require_relative 'weather'

class Airport

	DEFAULT_CAPACITY = 60
	include Weather

	def initialize(options = {})
		@terminal ||= []
		@capacity   = options.fetch(:capacity, DEFAULT_CAPACITY)
	end

	def capacity
		@capacity
	end

	def terminal
		@terminal
	end	
	
	def land_a(plane)
		raise 'This airport is full, wait in the air space' if full?
		terminal << plane
	end

	def release_a(plane)
		terminal.delete(plane)
	end

	def empty?
		!@terminal.nil?
	end

	def full?
		terminal.count >= capacity
	end

end



