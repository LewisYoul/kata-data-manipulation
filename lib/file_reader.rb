require_relative './line_processor'

class FileReader
  def initialize(filepath: 'data/weather.dat', line_processor: LineProcessor.new)
    @filepath = filepath
    @line_processor = line_processor
  end

  def read
    IO.readlines(@filepath).map.with_index do |line, i|
      next if i == 0 || i == 1 || i == 32 || i == 33
      @line_processor.process(line)
    end.compact
  end

  def read_teams
    IO.readlines(@filepath).map.with_index do |line, i|
      next if i == 0 || i == 18 || i == 22
      @line_processor.process_team(line)
    end.compact
  end
end
