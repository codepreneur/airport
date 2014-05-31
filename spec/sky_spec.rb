require 'sky'

describe Sky do

	let(:sky) {Sky.new}
	
	it 'can have no planes' do
		expect(sky).to be_empty
	end

	it 'can have planes' do
		sky.add(:plane)
		expect(sky.air_space).not_to be_empty
	end

	it 'can remove planes' do
		expect(sky).to receive(:add)
		sky.add(:plane)
	end

	it 'can add planes' do
		expect(sky).to receive(:remove)
		sky.remove(:plane)
	end

end