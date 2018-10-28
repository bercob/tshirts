#!/usr/bin/ruby

quest = File.open 'tshirts_1.txt'
tshirts_count, days_count = quest.gets.split(' ').map {|number| number.to_i}
tshirts = quest.gets.split(' ').map {|number| number.to_i}

if tshirts_count != tshirts.length
	p 'error'
	exit 1
end

definers = Array.new

days_count.times do
	definers.push quest.gets.strip
end

definers.each do |definer|
	p definer
end
