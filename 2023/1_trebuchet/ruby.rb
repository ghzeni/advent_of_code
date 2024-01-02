file_path = 'input/input.txt'  # Replace 'your_file.txt' with the actual file path

def get_calibration_value(line)
  first = nil
  last = nil

  calibration_value = ''
  line.each_char do |char|
    if char =~ /\d/
      first = char if first.nil?
      last = char if last.nil?
      last = char
    end
  end

  if first && last
    calibration_value = first + last
  else
    calibration_value = 0
  end

  return calibration_value.to_i
end

def get_sum(lines)
  sum = 0

  lines.each do |line|
    sum += get_calibration_value(line)
  end

  return sum
end

lines = File.readlines(file_path)
sum = get_sum(lines)

puts "The sum is: #{sum}"
