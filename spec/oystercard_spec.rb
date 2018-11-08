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
			station = Oystercard.new
			subject.touch_in(station)
			subject.touch_out(station)
			expect(subject.balance).to eq(4)
		end

		it "make sure the journey has been paid for" do
			station = Oystercard.new
			subject.touch_in(station)
			expect{ subject.touch_out(station) }.to change{ subject.balance }.by -Oystercard::MINIMUM_FARE
		end

	end

	describe "#in-out journey" do

		let (:station1) {double :station1}
		let (:station2) {double :station2}


		it "no action return in_use false" do
			expect(subject.in_use?).to be false
		end

		it "touched in return in_use true" do
			subject.top_up(5)
			subject.touch_in(station1)
			expect(subject.in_use?).to be true
		end

		it "touch out return in_use false" do
			subject.top_up(5)
			subject.touch_in(station1)
			subject.touch_out(station2)
			expect(subject.in_use?).to be false
		end

		it "ensures the card has sufficient balance for journey" do
			subject.top_up(0)
			expect{ subject.touch_in(station1) }.to raise_error "Insufficient funds for journey"
		end

	end

	describe "#zone testing" do

	end

end
