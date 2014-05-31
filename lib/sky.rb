class Sky

	def initialize
		@air_space ||= []
	end

	def air_space
		@air_space
	end

	def add(plane)
		air_space << plane
	end

	def remove(plane)
		air_space.delete(plane)
	end

	def empty?
		!@air_space.nil?
	end




end