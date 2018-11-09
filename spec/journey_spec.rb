require "journey"

describe Journey do

	let(:station1) {double :station1, zone:1, name: "White"}
	let(:station2) {double :station2, zone:2, name: "Red"}
	let(:station3) {double :station3, zone:3, name: "Black"}
	let(:station4) {double :station4, zone:4, name: "Green"}
	let(:station5) {double :station5, zone:5, name: "Blue"}


	it "in_journey? return false at the begining" do
		expect(subject.in_journey?).to eq false
	end

	it "in_journey? return true if entry called" do
		subject.entry(station1)
		expect(subject.in_journey?).to eq true
	end

  it "completed? show false initially" do
  	expect(subject.completed?).to eq false
  end

  it "completed? show false if touch in, no touch out" do
  	subject.entry(station3)
  	expect(subject.completed?).to eq false
  end

  it "completed? show true if touch in and touch out" do
  	subject.entry(station3)
  	subject.exit(station4)
  	expect(subject.completed?).to eq true
  end

  it 'default penalty fare if journey not completed' do
  	subject.entry(station3)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "fare return 1 if travel in same zone" do
  	subject.entry(station1)
  	subject.exit(station1)
  	expect(subject.fare).to eq 1
  end

  it "fare return 2 if cross 1 zone" do
  	subject.entry(station2)
  	subject.exit(station3)
  	expect(subject.fare).to eq 2
  end

  it "fare return 3 if cross 2 zones" do
  	subject.entry(station5)
  	subject.exit(station3)
  	expect(subject.fare).to eq 3
  end

end