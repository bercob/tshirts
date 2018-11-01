#!/usr/bin/ruby

quest = File.open 'tshirts_1.txt'
tshirts_count, days_count = quest.gets.split(' ').map {|number| number.to_i}
tshirts = quest.gets.split(' ').map {|number| number.to_i}

if tshirts_count != tshirts.length
  p 'error'
  exit 1
end

definers = Array.new
used_tshirts = Array.new

days_count.times do
  definers.push quest.gets.strip
end

p tshirts

definers.each do |definer|
  if definer == 'Z'
    tshirts[0] += 1
    used_tshirts.push 1
  elsif definer == 'L'
    min_number = tshirts.min
    min_index = tshirts.index min_number
    tshirts.delete_at min_index
    tshirts.unshift min_number + 1
    used_tshirts.push min_index + 1
  else
    p 'error: unknown definer'
    exit 2
  end
end

p tshirts
p used_tshirts
