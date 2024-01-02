# test_calibration.rb
require 'minitest/autorun'
require_relative 'solution'
require_relative 'ruby'

class TestCalibration < Minitest::Test
  def test_calibration_values_are_equal
    file_path = 'input/input.txt'
    lines = File.readlines(file_path)

    lines.each do |line|
      puts "Line #{lines.index(line) + 1} passed"
      assert_equal(extract_calibration_value(line), get_calibration_value(line))
    end
  end
end