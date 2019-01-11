require_relative './day'

class LineProcessor
  def process(line)
    line_array = line.split
    Day.new(dy: line_array[0].to_i, mxt: line_array[1].to_i, mnt: line_array[2].to_i)
  end

  def process_team(line)
    line_array = line.sub('-', '').split

    Team.new(name: line_array[1], goals_for: line_array[6].to_i, goals_against: line_array[7].to_i)
  end
end