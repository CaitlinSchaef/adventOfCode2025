# part one
# position = 50
# counter_of_zeroes = 0

# input = File.readlines('input.txt')

# input.each do |instruction|
#   direction = instruction[0]
#   distance = instruction[1..5].to_i

#   if direction == 'L'
#     position = position - distance
#     while position < 0
#       position = position + 100
#     end
#   else
#     position = position + distance
#     while position > 99
#       position = position - 100
#       p position
#     end
#   end

  #if position == 0
  #p '----'
  #p position
  #p distance
  #p direction
  #end

#   if position == 0
#     counter_of_zeroes += 1
#   end

# end

# p counter_of_zeroes

# part 2
position = 50
count = 0

File.readlines("input.txt").each do |instruction|
  direction = instruction[0]
  distance  = instruction[1..].to_i

  if direction == "R"
    if position == 0
      crosses = (position + distance - 1) / 100
    else
      crosses = (position + distance) / 100
    end
    count += crosses

    position = (position + distance) % 100
    if position == 0 && crosses == 0
      count += 1
    end
  else
    if position == 0
      crosses = (distance - 1) / 100
    else
      if distance > position
        crosses = (distance - position - 1) / 100 + 1
      else
        crosses = 0
      end
    end
    count += crosses

    position = (position - distance) % 100
    if position == 0 && crosses == 0
      count += 1
    end
  end
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
