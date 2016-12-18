#!/usr/bin/env ruby

#     ----- Загадывание цифр -----
zagadannye = [rand(9)]

while zagadannye.length < 4
	inc = rand(9)
	zagadannye << inc unless zagadannye.include?(inc)
end

#    ----- Начальные установки -----
puts "Угадывайте!"
bulls = 0
round = 0

#         ----- Шаг игры -----
while bulls < 4
	bulls = 0
	cows = 0
	round += 1
	puts "Попытка №#{round}\n"

#   ----- Ввод отгадываемых цифр -----

	vvod = gets.chomp.split("")

puts "#{zagadannye.join(' ')} \n #{vvod.join(' ')} \n"	# Вывод на экран загаданных и введенных цифр

#  ----- Инкремент быков и коров -----

	vvod.each_with_index do |cif, i| 
		if zagadannye.include?(cif.to_i)
			bulls += 1 if zagadannye[i] == cif.to_i
		cows += 1
		end
	end

	cows = cows - bulls
	puts "#{bulls} быка, #{cows} коровы\n"
end

puts "   Вы выиграли! Всего за #{round} раундов!   ".center(50, " * ")