puts "Введите число"
number = gets.chomp.to_i
puts "Введите высоту"
height = gets.chomp.to_i

def generate(number, height)
	if number < 0
		array = ["-1"]
	elsif height <= 0
		array = ["-2"]
	else
		array = [number.to_s]
	end

	for i in 1..height-1 do
		lastChars = array[i-1]
		stringBuilder = ""

		newChar = lastChars[0]
		count = 1

		if lastChars.length == 1 then
			stringBuilder += count.to_s
			stringBuilder += newChar
		end

		for j in 1..lastChars.length-1 do
			if lastChars[j] == lastChars[j-1] then
				count += 1
			else 
				stringBuilder += count.to_s
				stringBuilder += newChar
				newChar = lastChars[j]
				count = 1
			end

			if j == lastChars.length-1 then
				stringBuilder += count.to_s
				stringBuilder += newChar
			end
		end
		array.append(stringBuilder)
	end

	return array
end

puts "Ваша последовательность:"
consequence = generate(number,height)
if consequence[0] == "-1"
	puts "Вы не можете сгенерировать последовательность для чисел ниже нуля"
elsif consequence[0] == "-2"
	puts "Вы не можете сгенерировать последовательность для высоты 0 или ниже"
else
	puts consequence
end



		