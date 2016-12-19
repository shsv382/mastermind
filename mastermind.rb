#!/usr/bin/env ruby

#     ----- Загадывание цифр -----
zagadannye = [rand(9)]

while zagadannye.length < 4
	inc = rand(9)
	zagadannye << inc #unless zagadannye.include?(inc)
end

#    ----- Начальные установки -----
puts "Угадывайте!"
bulls = 0
round = 0
bulls_check = Array.new(4, " ")
round = 0
#         ----- Шаг игры -----
until (bulls == 4) || (round == 12)
	bulls = 0
	cows = 0
	round += 1
	puts "Попытка №#{round}\n"

#   ----- Ввод отгадываемых цифр -----

	vvod = gets.chomp.split("")

#  ----- Инкремент быков -----

	vvod.each_with_index do |cif, i| 
		if zagadannye.include?(cif.to_i) && zagadannye[i] == cif.to_i
			bulls += 1 
			bulls_check[i] = "^"
		end
	end

#  ----- Инкремент коров -----

	vvod.uniq.each do |cif|
		cows += [vvod.count(cif), zagadannye.count(cif.to_i)].min
	end

#  ----- Убираем повторы -----
	cows = cows - bulls

	puts "#{vvod.join(' ')}\n#{bulls_check.join(' ')}\n"	# Вывод на экран загаданных и введенных цифр

	puts "#{bulls} быка, #{cows} коровы\n"

end

puts "   Вы выиграли! Всего за #{round} раундов!   ".center(50, " * ") if round <= 12 && bulls == 4
puts "   Игра окончена!  ".center(50, " * ")