require 'airport'
 

describe Airport do
  let(:airport) { Airport.new(:capacity => 50) }

  it 'allows setting default capacity upon initialising' do
    expect(airport.capacity).to eq 50
  end
  
  context 'taking off and landing' do
    it 'a plane can land' do
      allow(airport).to receive(:check){'sunny'}
      airport.land_a(:plane)
      expect(airport.terminal).not_to be_empty
    end
    
    it 'a plane can take off' do
      allow(airport).to receive(:check){'sunny'}
      airport.land_a(:plane)
      allow(airport).to receive(:check){'sunny'}
      airport.release_a(:plane)
      expect(airport.terminal).to be_empty

    end
  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      50.times do 
        allow(airport).to receive(:check){'sunny'}
        airport.land_a(:plane)
      end
      allow(airport).to receive(:check){'sunny'}
      expect(airport.land_a(:plane)).to eq 'its full, wait in the air space queue!'
    end

    it 'airport can be full' do
      50.times do 
        allow(airport).to receive(:check){'sunny'}
        airport.land_a(:plane)
      end
      expect(airport).to be_full
    end
    

    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        airport.land_a(:plane)
        allow(airport).to receive(:check){'stormy'}
        expect(airport.release_a(:plane)).to eq 'its stormy! can only fly when its sunny!'
        

      end
      
      it 'a plane cannot land in the middle of a storm' do
        allow(airport).to receive(:check){'stormy'}
        expect(airport.land_a(:plane)).to eq 'its stormy! can only land when its sunny!'
      end
    end
  end
end
 
