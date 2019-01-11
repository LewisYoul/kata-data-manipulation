require_relative './file_reader'

class Day
  def initialize(dy:, mxt:, mnt:)
    @number = dy
    @max_temp = mxt
    @min_temp = mnt
  end

  attr_reader :number, :max_temp, :min_temp

  def self.all
    file_reader.read
  end

  def spread
    @max_temp - @min_temp
  end

  def self.day_with_min_spread
    ordered_days = self.all.sort_by do |day|
      day.spread
    end

    ordered_days.first
  end

  private

  def self.file_reader
    @file_reader ||= FileReader.new
  end

end