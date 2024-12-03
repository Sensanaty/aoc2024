# frozen_string_literal: true

require_relative '../file_helper'

INPUT = FileHelper.read_input.lines.map { |line| line.split.map(&:to_i) }

def part_one(numbers)
  all_ascending = numbers.each_cons(2).all? { |a, b| a < b && (a - b).abs <= 3 }
  all_descending = numbers.each_cons(2).all? { |a, b| a > b && (a - b).abs <= 3 }

  all_ascending || all_descending
end

PART_1_SOLUTION = INPUT.map { |list| part_one(list) }.count(true)
puts "Part 1: #{PART_1_SOLUTION}"

def part_two(numbers)
  numbers.each_index.any? do |index|
    new_numbers = numbers.clone
    new_numbers.delete_at(index)

    part_one(new_numbers)
  end
end

PART_2_SOLUTION = INPUT.map { |list| part_two(list) }.count(true)
puts "Part 2: #{PART_2_SOLUTION}"
