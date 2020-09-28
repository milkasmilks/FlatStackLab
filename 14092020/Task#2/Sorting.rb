class DataSorting
	def initialize(file_name)
		@array = read_file(file_name)
	end

	def method_missing(method_name)
		if method_name =~ /^sort_by_/ then
			column_to_sort = method_name.to_s.sub!("sort_by_","")
			column_number = 0
			while @array[0][column_number].to_s.strip.downcase == column_to_sort.to_s.strip.downcase do
				column_number += 1
			end
			columns = array.delete_at(0)
			array = @array.sort {|a,b| a[column_number] <=> b[column_number]}
			
			File.open("data_sorted_by_#{column_to_sort}", "w") do |file|
				file.puts columns.join(', ')
				array.each {|el| file.puts el.join(', ')}
			end
		end
	end

	def array
		@array
	end

	def read_file(file_name)
		array = []
		File.foreach(file_name) do |line|
			array.append(line.split(", "))
		end
		return array
	end
end

data = DataSorting.new("text.txt")

puts("Columns to choose:")
puts data.array[0]
puts("\nPlease, type column name to sort by:")
column_name = gets

data.public_send("sort_by_#{column_name}")

