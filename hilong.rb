#!/usr/bin/env ruby

# A file is passed in as an argument
input = File.open(ARGV[0])

# escaped bash color codes
red = "\e[31m"
reset_color = "\e[0m"

maximum_line_length = 80

# For each line of the input...
input.each_line do |line|
  # Construct a string that begins with the length of this line
  # and ends with the content. The trailing newline is #chop'ped
  # off of the content so we can control where the newline occurs.
  # The strings are joined with a tab character so that indentation
  # is preserved.
  output_line = [line.length, line.chop].join("\t")

  if line.length > maximum_line_length
    # Turn the output to red starting at the first character.
    output_line.insert(0, red)
    # Reset the text color back to what it was at the end of the
    # line.
    output_line.insert(-1, reset_color)
  end

  $stdout.puts output_line
end