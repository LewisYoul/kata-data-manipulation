require 'line_processor'

RSpec.describe LineProcessor do

  describe '#process' do
    let(:line) do
      '1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5'
    end
    
    let(:line_with_asterisk) do
      '1  88    59*    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5'
    end
    
    it 'creates a day object for each line' do
      expect(described_class.new.process(line)).to be_an_instance_of(Day)
    end
    
    it 'sets the attributes correctly' do
      day = described_class.new.process(line)
      
      expect(day.number).to eq(1)
      expect(day.max_temp).to eq(88)
      expect(day.min_temp).to eq(59)
    end
    
    it 'sets the attributes correctly when there is an asterisk' do
      day = described_class.new.process(line_with_asterisk)
      
      expect(day.number).to eq(1)
      expect(day.max_temp).to eq(88)
      expect(day.min_temp).to eq(59)
    end
  end
  
  describe '#process_team' do
    let(:line) do
      '    1. Arsenal         38    26   9   3    79  -  36    87'
    end

    it 'creates a team object for each line' do
      expect(described_class.new.process_team(line)).to be_an_instance_of(Team)
    end
  end
end