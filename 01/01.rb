# frozen_string_literal: true

require_relative '../file_helper'

def part_1
  input = FileHelper.read_input

  left = []
  right = []

  input.each_line do |line|
    l, r = line.split(/\s+/).map(&:to_i)
    left << l
    right << r
  end

  left.sort!
  right.sort!

  distance = 0
  left.zip(right).sum do |l, r|
    distance += (l - r).abs
  end

  distance
end

puts "Part 1: #{part_1}"
