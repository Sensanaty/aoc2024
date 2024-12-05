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

def part_two
  count = 0

  directions = [
    # northwest to southeast diagonal
    [[-1, 1], [1, -1]],
    # northeast to southwest diagonal
    [[-1, -1], [1, 1]]
  ]

  INPUT.each_with_index do |_row, row_index|
    INPUT[row_index].each_with_index do |_col, col_index|
      next unless INPUT[row_index][col_index] == 'A'

      is_xmas = true

      directions.each do |direction|
        row_one_index = row_index + direction[0][0]
        col_one_index = col_index + direction[0][1]

        row_two_index = row_index + direction[1][0]
        col_two_index = col_index + direction[1][1]

        if row_one_index.negative? ||
           row_one_index > INPUT.length - 1 ||
           col_one_index.negative? ||
           col_one_index > INPUT[row_index].length - 1 ||
           row_two_index.negative? ||
           row_two_index > INPUT.length - 1 ||
           col_two_index.negative? ||
           col_two_index > INPUT[row_index].length - 1
          is_xmas = false
          break
        end

        if (INPUT[row_one_index][col_one_index] == 'M' && INPUT[row_two_index][col_two_index] == 'S') ||
           (INPUT[row_one_index][col_one_index] == 'S' && INPUT[row_two_index][col_two_index] == 'M')
          next
        end

        is_xmas = false
        break
      end

      count += 1 if is_xmas
    end
  end

  count
end

p part_two
