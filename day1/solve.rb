# part one
position = 50
counter_of_zeroes = 0

input = File.readlines('input.txt')

input.each do |instruction|
  direction = instruction[0]
  distance = instruction[1..5].to_i

  if direction == 'L'
    position = position - distance
    while position < 0
      position = position + 100
    end
  else
    position = position + distance
    while position > 99
      position = position - 100
      p position
    end
  end

  #if position == 0
  #p '----'
  #p position
  #p distance
  #p direction
  #end

  if position == 0
    counter_of_zeroes += 1
  end

end

p counter_of_zeroes

# part 2
position = 50
count = 0

File.readlines("input.txt").each do |instruction|
  direction = instruction[0]
  distance  = instruction[1..].to_i

  if direction == "R"
    goes_all_the_way_around = (position + distance) / 100
    count += goes_all_the_way_around

    position = (position + distance) % 100
  else
    goes_all_the_way_around = (distance - position + 99) / 100
    count += goes_all_the_way_around

    position = (position - distance) % 100
  end

  count += 1 if position == 0
end

p count


# Or something like:
#     pos = 50
#     count_zero = 0

#     instructions.strip.each_line do |line|
#       line = line.strip
#       direction = line[0]
#       value = line[1..].to_i

#       pos = (direction == 'R') ? (pos + value) % 100 : (pos - value) % 100
#       count_zero += 1 if pos == 0
#     end

#     puts "Password = #{count_zero}"
#   end
# end
