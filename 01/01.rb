# frozen_string_literal: true

require_relative '../file_helper'

INPUT = FileHelper.read_input

def make_left_and_right
  left = []
  right = []

  INPUT.each_line do |line|
    l, r = line.split(/\s+/).map(&:to_i)
    left << l
    right << r
  end

  [left, right]
end

def part_one
  left, right = make_left_and_right

  left.sort!
  right.sort!

  left.zip(right).sum do |l, r|
    (l - r).abs
  end
end

# 1970720
PART_1_SOLUTION = part_one
puts "Part 1: #{PART_1_SOLUTION}"

def part_two
  left, right = make_left_and_right

  right_tally = right.tally

  left.sum do |num|
    num * right_tally.fetch(num, 0)
  end
end

# 17191599
PART_2_SOLUTION = part_two
puts "Part 2: #{PART_2_SOLUTION}"
