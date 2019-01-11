require 'team'
require 'ostruct'

RSpec.describe Team do
  let(:mock_data) do
    {
      name: 'Arsenal',
      goals_for: 79,
      goals_against: 36
    }
  end

  it 'sets the required attributes for the team from the provided data' do
    team = described_class.new(mock_data)
    
    expect(team.name).to eq 'Arsenal'
  end
  
  describe '.all' do
    # it 'invokes #read on the filereader' do
    #   allow(reader_instance).to receive(:read)

    #   described_class.all

    #   expect(reader_instance).to have_received(:read)
    # end
  end
end