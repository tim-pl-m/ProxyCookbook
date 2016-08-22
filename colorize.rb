#!/usr/bin/env ruby

require 'colorize'

if ARGV.first == "--list-colors"
  puts String.colors
  exit
elsif ARGV.size != 2
  puts "USAGE: colorize COLOR STRING"
  puts
  puts "To list availaible colors:"
  puts "  colorize --list-colors"
  exit
end

color = ARGV[0].to_sym
string = ARGV[1]

while input = STDIN.gets
  input.each_line do |line|
    begin
      $stdout.puts line.gsub(string) { |s| s.colorize(color) }
    rescue Errno::EPIPE
      exit(74)
    end
  end
end