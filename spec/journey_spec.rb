require "journey"

describe Journey do

	let(:station1) {double :station1}
	let(:station2) {double :station2}

	it "in_journey? return false at the begining" do
		expect(subject.in_journey?).to eq false
	end

	it "in_journey? return true if entry called" do
		subject.entry(station1)
		expect(subject.in_journey?).to eq true
	end
	
  it 'default penalty fare' do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "penalty if entry when card already in use" do
  	subject.entry(station1)
  	expect(subject.entry(station1)).to eq Journey::PENALTY_FARE
  end

  it "penalty if exit when card is not in use" do
  	expect(subject.exit(station1)).to eq Journey::PENALTY_FARE
  end

 #  it "store the entery and exit station" do
	# 	subject.entry(station1)
	# 	subject.exit(station2)
	# 	expect(subject.journey_history).to eq [{:entry_station=>station1, :exit_station=>station2}]
	# end

end