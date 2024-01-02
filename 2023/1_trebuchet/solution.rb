file_path = 'input/input.txt'

lines = []
def extract_calibration_value(line)
  first_digit = line[/\d/]
  last_digit = line[/\d(?=\D*$)/]

  calibration_value = (first_digit + last_digit).to_i

  return calibration_value
end

def sum_calibration_values(lines)
  sum = 0

  lines.each do |line|
    calibration_value = extract_calibration_value(line)
    sum += calibration_value
  end

  return sum
end

File.foreach(file_path) do |line|
  lines << line
end

total_sum = sum_calibration_values(lines)
puts "Total Sum: #{total_sum}"
