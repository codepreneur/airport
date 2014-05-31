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
		return 'its stormy! can only land when its sunny!' if check == 'stormy'
		return 'its full, wait in the air space queue!' if full?
		terminal << plane
	end

	def release_a(plane)
		return 'its stormy! can only fly when its sunny!' if check == 'stormy'
		terminal.delete(plane)
	end

	def empty?
		!@terminal.nil?
	end

	def full?
		terminal.count >= capacity
	end

end



