# frozen_string_literal: true

# Generic method to simplify grabbing the input files
module FileHelper
  class Error < StandardError; end
  class FileNotFoundError < Error; end

  def self.read_input
    current_dir = File.dirname(caller_locations.first.path)
    input_path = File.join(current_dir, 'input.txt')

    raise FileNotFoundError, "Could not find input.txt in #{current_dir}" unless File.exist?(input_path)

    File.read(input_path)
  rescue Errno::EACCES => e
    raise Error, "Permission denied while reading input.txt: #{e.message}"
  rescue Errno::ENOENT => e
    raise FileNotFoundError, "Error accessing input.txt: #{e.message}"
  rescue StandardError => e
    raise Error, "Unexpected error while reading input.txt: #{e.message}"
  end
end
