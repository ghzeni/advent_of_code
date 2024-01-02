file_path = 'input/input.txt'
$bag = {:red => 12, :green => 13, :blue => 14}
games = []
sum = 0
file = File.open(file_path, "r")
input = file.read()
lines = input.split("\n")
lines.each.with_index do |line, line_i|
  game = {:i=>line_i+1,:red=>0,:green=>0,:blue=>0,:v=>false}
  line = line.split(":")[1].strip.split(";")
  line.each.with_index do |draw, draw_i|
    draw = draw.split(", ")
    draw.each.with_index do |ball|
      quantity, color = ball.split(" ")
      if quantity.to_i >= game["#{color}".to_sym].to_i
        game["#{color}".to_sym]=quantity.to_i
      end
    end
  end
  games.append(game)
end

games.each do |game| 
  if game[:red] <= $bag[:red] and game[:green] <= $bag[:green] and game[:blue] <= $bag[:blue]
    sum+=game[:i]
  end
end
  
puts sum.to_s