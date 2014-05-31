require 'airport'
 
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let(:airport) { Airport.new(:capacity => 50) }

  it 'allows setting default capacity upon initialising' do
    expect(airport.capacity).to eq 50
  end
  
  context 'taking off and landing' do
    it 'a plane can land' do
      airport.land_a(:plane)
      expect(airport.terminal).not_to be_empty
    end
    
    it 'a plane can take off' do
      airport.land_a(:plane)
      airport.release_a(:plane)
      expect(airport.terminal).to be_empty

    end
  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      50.times {airport.land_a(:plane)}
      expect{airport.land_a(:plane)}.to raise_error RuntimeError
    end

    it 'airport can be full' do
      50.times {airport.land_a(:plane)}
      expect(airport).to be_full
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing' do
      end
      
      xit 'a plane cannot land in the middle of a storm' do
      end
    end
  end
end
 
