# frozen_string_literal: true

require_relative '../file_helper'

INPUT = FileHelper.read_input

def part_one
  word = 'XMAS'
  count = 0
  grid = INPUT.split("\n").map(&:chars)

  direction = [
    # Right
    [0, 1],
    # Left
    [0, -1],
    # Up
    [1, 0],
    # Down
    [-1, 0],
    # Up Right
    [1, 1],
    # Up Left
    [1, -1],
    # Down Right
    [-1, 1],
    # Down Left
    [-1, -1]
  ]

  grid.each_with_index do |row, row_index|
    row.each_with_index do |_col, col_index|
      direction.each do |dir|
        is_xmas = true

        x = dir[0]
        y = dir[1]

        word.each_char.with_index do |char, char_index|
          row_offset = row_index + (x * char_index)
          col_offset = col_index + (y * char_index)

          if row_offset.negative? || row_offset >= grid.count || col_offset.negative? || col_offset >= grid[row_index].count
            is_xmas = false
            break
          end

          if grid[row_offset][col_offset] != char
            is_xmas = false
            break
          end
        end

        count += 1 if is_xmas
      end
    end
  end

  count
end

p part_one
