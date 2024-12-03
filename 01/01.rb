# frozen_string_literal: true

require_relative '../file_helper'

INPUT = FileHelper.read_input

def part_1
  left = []
  right = []

  INPUT.each_line do |line|
    l, r = line.split(/\s+/).map(&:to_i)
    left << l
    right << r
  end

  left.sort!
  right.sort!

  left.zip(right).sum do |l, r|
    (l - r).abs
  end
end

puts "Part 1: #{part_1}"
