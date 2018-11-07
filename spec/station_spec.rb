require 'station'

describe Station do

  let(:zone1) {double :zone1}
  let(:somewhere) {double :somethere}
  #let(:station) {Station.new(name, zone)}

  it 'return station name' do
    station = Station.new(zone1,somewhere)          
    expect(station.name).to eq somewhere              
  end                                                   

  it 'return zone' do
    station = Station.new(zone1,somewhere) 
    expect(station.zone).to eq zone1                                
  end

end