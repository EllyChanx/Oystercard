require "journeylog"

describe JourneyLog do 

	let (:station1) {double :station1}
	let (:station2) {double :station2}

	# let(:journey){ double :journey } #this may need to have some methods
 #  let(:station){ double :station }
 #  let(:journey_class){double :journey_class, new: journey}
 #  subject {described_class.new(journey_class: journey_class)}

	# it "start would starts a new journey" do
	# 	expect(subject.start(teststation)).to include(:entry_station => teststation)
	# end

	it "store the entery and exit station" do
		subject.start(station1)
		subject.finish(station2)
		expect(subject.journey_history).to eq [{:entry_station=>station1, :exit_station=>station2}]
	end
		
  it 'journey records a new journey' do
    expect(subject.journey_history).to eq [nil]
  end

  it 'journey records a starts journey' do
  	subject.start(station1)
    expect(subject.journey_history).to eq [{:entry_station=>station1}]
  end


end 