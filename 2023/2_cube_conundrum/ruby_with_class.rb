file_path = 'input/input.txt'

$bag = {
  "red" => 12, 
  "green" => 13, 
  "blue" => 14
}

class Game 
  attr_accessor :index, :red, :green, :blue, :possible

  def initialize(index)
    @index = index+1
    @red = [0]
    @green = [0]
    @blue = [0]
    @possible = false
  end

  def add_draw(color, quantity)
    case color
    when "red"
      @red.append(quantity)
    when "green"
      @green.append(quantity)
    when "blue"
      @blue.append(quantity)
    end
  end

  def is_possible
    if (@red.max <= $bag["red"]) and (@green.max <= $bag["green"]) and (@blue.max <= $bag["blue"])
      @possible = true
    else @possible = false
    end
  end
end

games = []
sum = 0

file = File.open(file_path, "r")
input = file.read()
lines = input.split("\n")
lines.each.with_index do |line, line_i|
  game = Game.new(line_i)
  line = line.split(":")[1].strip
  line = line.split(";")
  line.each.with_index do |draw, draw_i|
    draw = draw.split(", ")
    draw.each.with_index do |ball|
      quantity, color = ball.split(" ")
      game.add_draw(color, quantity.to_i)
    end
  end
  game.is_possible
  games.append(game)
end

games.each do |game| 
  print game.index.to_s + " " + "red: " + game.red.max.to_s + " green: " + game.green.max.to_s + " blue: " + game.blue.max.to_s + " poss:" + game.possible.to_s + "\n" 
  if game.possible
    sum+=game.index
  end
end
  
puts sum.to_s