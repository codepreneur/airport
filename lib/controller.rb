require_relative 'weather'

class Controller

	include Weather


	def send_plane(from_airport,plane,sky,to_airport)
		until from_airport.check == 'sunny' do
			from_airport.release_a(plane)
		end
		plane.take_off!
		sky.add(plane)
		until to_airport.check == 'sunny' && !to_airport.full? do
			to_airport.land_a(plane)
		end
		plane.land!

	end

	def add_plane_to(airport,plane)
		airport.land_a(plane)
		plane.land!
	end


end