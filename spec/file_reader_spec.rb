require 'spec_helper'
require 'file_reader'

RSpec.describe FileReader do
  subject do
    FileReader
      .new(filepath: 'data/weather.dat', line_processor: line_processor)
      .read
  end

  let(:line_processor) do
    klass = Class.new do
      def process(string)
        string.strip
      end
    end

    klass.new
  end

  let(:sample_file_contents) do
    [
      'Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP',
      '1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5'
    ]
  end

  it 'reads file lines do' do
    expect(subject).to include(
      *sample_file_contents
    )
  end
end
