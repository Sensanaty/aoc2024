# frozen_string_literal: true

require_relative '../file_helper'

INPUT = FileHelper.read_input

# String literal `mul`
# Followed by a string literal `(`
# Followed by digits, between 1 and 3 of them (wrapped in capture group 1, aka num1)
# Followed by a string literal `,`
# Followed by digits, between 1 and 3 of them (wrapped in capture group 2, aka num2)
# Followed by a string literal `)`
# Case insensitive
REGEX_PART_ONE = /mul\((\d{1,3}),(\d{1,3})\)/i.freeze

def part_one
  INPUT.scan(REGEX_PART_ONE).reduce(0) do |sum, (num1, num2)|
    sum + num1.to_i * num2.to_i
  end
end

p part_one
