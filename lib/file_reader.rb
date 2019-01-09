class FileReader
  def initialize(filepath:, line_processor:)
    @filepath = filepath
    @line_processor = line_processor
  end

  def read
    IO.readlines(@filepath).map do |line|
      @line_processor.process(line)
    end
  end
end
