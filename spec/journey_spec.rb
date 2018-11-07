require "journey"

describe Journey do

	it "in_journey? return false at the begining" do
		expect(subject.in_journey?).to eq false
	end

	it "in_journey? return true if in_station? called" do
		subject.in_station
		expect(subject.in_journey?).to eq true
	end

	

end