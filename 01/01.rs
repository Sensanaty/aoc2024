use std::collections::HashMap;
use std::fs;
use std::path::PathBuf;

fn get_input_path() -> PathBuf {
  let exe_path = std::env::current_exe().expect("Could not find executable path");
  let workspace_root = exe_path.ancestors().nth(3).expect("Invalid path structure");

  workspace_root.join("01").join("input.txt")
}

fn main() {
  let input_path = get_input_path();
  let input = fs::read_to_string(input_path).expect("Should have been able to read input.txt");

  println!("Part 1 Answer: {}", solve_part1(&input));
  println!("Part 2 Answer: {}", solve_part2(&input));
}

fn make_left_and_right(input: &str) -> (Vec<i32>, Vec<i32>) {
  // Count lines first to allocate exact capacity
  // The small overhead of counting is worth it for avoiding the allocations
  let line_count = input.lines().count();
  let mut left = Vec::with_capacity(line_count);
  let mut right = Vec::with_capacity(line_count);

  for line in input.lines() {
    let numbers: Vec<&str> = line.split_whitespace().collect();

    let l: i32 = numbers[0].parse().expect("Failed to parse left number");
    let r: i32 = numbers[1].parse().expect("Failed to parse right number");

    left.push(l);
    right.push(r);
  }

  (left, right)
}

fn solve_part1(input: &str) -> i32 {
  let (mut left, mut right) = make_left_and_right(input);

  left.sort_unstable();
  right.sort_unstable();

  let count = left
    .iter()
    .zip(right.iter())
    .map(|(l, r)| (l - r).abs())
    .sum();

  count
}

fn solve_part2(input: &str) -> i32 {
  let (left, right) = make_left_and_right(input);

  // Pre-calculate the hash map size for better performance
  let mut right_tally = HashMap::with_capacity(right.len());
  for &num in right.iter() {
    // or_insert here will return a reference to the value, so we have to deference * it to use it
    *right_tally.entry(num).or_insert(0) += 1;
  }

  let mut sum = 0;
  for &num in left.iter() {
    if let Some(&count) = right_tally.get(&num) {
      sum += num * (count as i32);
    }
  }

  sum
}
