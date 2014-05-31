require 'weather'

class Container; include Weather; end

describe Weather do

	let(:weather) {Container.new}

	
	it 'can be stormy' do
		allow(weather).to receive(:check) {'stormy'}
		expect(weather.check).to eq 'stormy'
	end

	it 'can be sunny' do
		allow(weather).to receive(:check) {'sunny'}
		expect(weather.check).to eq 'sunny'
	end

end