require_relative './file_reader'
class Team
  def initialize(name: , goals_for: , goals_against: )
    @name = name
    @goals_for = goals_for
    @goals_against = goals_against
  end

  attr_reader :name, :goals_for, :goals_against

  def self.all
    file_reader.read_teams
  end

  def goal_difference
    (@goals_for - @goals_against).abs
  end

  def self.smallest_goal_difference
    ordered_teams = self.all.sort_by do |team|
      team.goal_difference
    end

    ordered_teams.first
  end

  private

  def self.file_reader
    FileReader.new(filepath: 'data/football.dat')
  end
end