require 'station'

describe Station do

  let(:zone) {double :zone}
  let(:name) {double :name}
  #let(:test_station) {Station.new(name, zone)}

  it 'return station name' do
    station = Station.new(zone,name)          
    expect(station.name).to eq name              
  end                                                   

  it 'return zone' do
    station = Station.new(zone,name) 
    expect(station.zone).to eq zone                                
  end

end