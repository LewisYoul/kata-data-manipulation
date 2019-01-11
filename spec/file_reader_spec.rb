require 'spec_helper'
require 'file_reader'

RSpec.describe FileReader do
  subject do
    FileReader
      .new(filepath: 'data/weather.dat', line_processor: line_processor)
      .read
  end

  let(:line_processor) do
    instance_double(LineProcessor, process: 'day_object')
  end

  let(:sample_file_contents) do
    [
      'Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP',
      '1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5'
    ]
  end

  it 'only counts lines that do begin with an integer' do
    
  end

  it 'reads file lines do' do
    expect(subject.length).to eq(30)
  end

  it 'reads football lines' do
    expect(described_class.new(filepath: 'data/football.dat', line_processor: line_processor).read_teams.length).to eq(20)
  end
end
