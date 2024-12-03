# frozen_string_literal: true

require_relative '../file_helper'

INPUT = FileHelper.read_input

def generate_reports
  INPUT.each_line.map { |line| line.split("\n") }.flatten
end

def part_one
  reports = generate_reports

  safe_count = 0

  reports.each do |report|
    previous_direction = nil
    is_safe = true

    report.split("\s").map(&:to_i).each_cons(2) do |a, b|
      difference = a - b

      new_direction =
        if difference.positive?
          :increase
        elsif difference.negative?
          :decrease
        else
          :stable
        end

      if difference.abs > 3 ||
         new_direction == :stable ||
         (previous_direction && previous_direction != new_direction)
        is_safe = false
        break
      end

      previous_direction = new_direction
    end

    safe_count += 1 if is_safe
  end

  safe_count
end

PART_1_SOLUTION = part_one
puts "Part 1: #{PART_1_SOLUTION}"
