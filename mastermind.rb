#!/usr/bin/env ruby

zagadannye = [rand(9)]

while zagadannye.length < 4
	inc = rand(9)
	zagadannye << inc unless zagadannye.include?(inc)
end

puts "Угадывайте!"
bulls = 0
round = 0

while bulls < 4
	bulls = 0
	cows = 0
	round += 1
	puts "Попытка №#{round}"

	vvod = gets.chomp.split("")
#	vvod.each { |i| i.to_i }
#	zagadannye.each { |i| i.to_i }
puts zagadannye
puts "\n"
puts vvod
puts "#{zagadannye.include?(vvod[0].to_i)}"

	vvod.each_with_index do |cif, i| 
	if zagadannye.include?(cif.to_i)
		bulls += 1 if zagadannye[i] == cif.to_i
		cows  += 1 
	end

end

	cows = cows - bulls
	puts "#{bulls} быка, #{cows} коровы\n"
end

puts "   Вы выиграли! Всего за #{round} раундов!   ".center(50, " * ")