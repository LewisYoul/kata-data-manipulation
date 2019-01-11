require 'day'
require 'ostruct'

RSpec.describe Day do
  let(:mock_data) do
    {
      dy: 1,
      mxt: 88,
      mnt: 59
    }
  end

  let(:mock_data_2) do
    {
      dy: 1,
      mxt: 88,
      mnt: 70
    }
  end

  let(:day_1) { Day.new(mock_data) }
  let(:day_2) { Day.new(mock_data_2) }
  
  let(:reader_instance) do
    OpenStruct.new(read: [day_1, day_2])
  end

  before do
    allow(FileReader).to receive(:new).and_return(reader_instance)
  end

  it 'sets the required attributes for the day from the provided data' do
    day = described_class.new(mock_data)
    
    expect(day.number).to eq 1
  end
  
  describe '.all' do
    it 'invokes #read on the filereader' do
      allow(reader_instance).to receive(:read)

      described_class.all

      expect(reader_instance).to have_received(:read)
    end
  end

  describe '#spread' do
    it 'calculates the temperature spread for the day' do
      expect(described_class.new(mock_data).spread).to eq(88-59)
    end
  end

  describe '#day_with_min_spread' do
    it 'calculates the minimum spread of all days' do
      expect(described_class.day_with_min_spread.number).to eq(day_2.number)
    end
  end
end