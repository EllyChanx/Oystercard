require 'oystercard'

describe Oystercard do

	describe "#balance" do
		it "responds to :balance" do
			expect(subject).to respond_to(:balance)
		end
	end

	describe "#top_up" do
		it "tops up the balance of the oystercard" do
			expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
		end

		it "enforce the upper limit of the card" do
			maximum_balance = Oystercard::MAXIMUM_BALANCE
			expect{ subject.top_up(maximum_balance+1) }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
		end

		it "checks the minimum fair of the journey" do
			expect(Oystercard::MINIMUM_FARE).to eq 1
		end
	end

	describe "#deduct" do

		before(:each) do
				subject.top_up(5)
		end

		it "deducts the correct fair from balance" do
			subject.touch_out
			expect(subject.balance).to eq(4)
		end

		it "make sure the journey has been paid for" do
			expect{ subject.touch_out }.to change{ subject.balance }.by -Oystercard::MINIMUM_FARE
		end

	end

	describe "#in-out journey" do

		let (:station) {double :station}

		it "checks if you are in journey after touched in" do
			subject.top_up(5)
			subject.touch_in(station)
			expect(subject).to be_in_journey
		end
		it "check if you are not in journey after touch out" do
			subject.top_up(5)
			subject.touch_in(station)
			subject.touch_out
			expect(subject).to_not be_in_journey
		end
		it "ensures the card has sufficient balance for journey" do
			subject.top_up(0)
			expect{ subject.touch_in(station) }.to raise_error "Insufficient funds for journey"
		end

		it "accept station when touch in" do
			subject.top_up(5)
			subject.touch_in(station)
			expect(subject.entry_station).to eq station
		end
	end

end
