require "journeylog"

describe JourneyLog do 

	let (:station1) {double :station1}
	let (:station2) {double :station2}

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