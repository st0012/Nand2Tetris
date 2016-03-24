require "pry"

def get_file
  file_name = ARGV[0]
  file_path = "#{File.expand_path(File.dirname(__FILE__))}/#{file_name}"
  File.open(file_path)
end

file = get_file

# regex
COMMENT = /\/\/.*/
A_INSTRUCTION = /^@\d*/

def clean_comments_and_white_spaces(file)
  file.map do |l|
    code = l.gsub(COMMENT, '').strip
    code unless code.empty?
  end.compact
end

def a_instuction_to_bin(instruction)
  instruction.to_i.to_s(2).rjust(16, "0")
end

codes = clean_comments_and_white_spaces(file)
codes = codes.map do |l|
  match = l.match(A_INSTRUCTION)

  if match
    a_instruction = match[0]
    a_instruction.sub!("@", "")
    a_instuction_to_bin(a_instruction)
  else
    l
  end
end

binding.pry

puts codes


