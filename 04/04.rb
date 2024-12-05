# frozen_string_literal: true

require_relative '../file_helper'

INPUT = FileHelper.read_input.split("\n").map(&:chars).freeze

def part_one
  word = 'XMAS'

  directions = {
    right: [0, 1],
    left: [0, -1],
    up: [1, 0],
    down: [-1, 0],
    up_right: [1, 1],
    up_left: [1, -1],
    down_right: [-1, 1],
    down_left: [-1, -1]
  }

  INPUT.each_index.sum do |row|
    INPUT[row].each_index.sum do |col|
      directions.values.count do |row_dir, col_dir|
        word.each_char.with_index.all? do |char, char_index|
          row_offset = row + (row_dir * char_index)
          col_offset = col + (col_dir * char_index)

          row_offset.between?(0, INPUT.length - 1) &&
            col_offset.between?(0, INPUT[0].length - 1) &&
            INPUT[row_offset][col_offset] == char
        end
      end
    end
  end
end

p part_one
