require_relative 'weather'

class Controller

	include Weather


	def send_plane(from_airport,plane,sky,to_airport)
		from_airport.release_a(plane)
		plane.take_off!
		sky.add(plane)
		to_airport.land_a(plane)
		plane.land!
		
	end

	def add_plane_to(airport,plane)
		airport.land_a(plane)
		plane.land!
	end


end