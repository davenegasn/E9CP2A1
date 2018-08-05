class Table

	def initialize(mesa, *days)
		@mesa = mesa 
		@days = days 
	end 

	def highest_day
		indice = @days.index(@days.max)
		dia = indice.to_i + 1
		puts "The highest day for #{@mesa} is #{@days.max} on day #{dia}"
	end 

	def table_average
		table_total = 0
		@days.each do |day|
			table_total += day.to_i
		end 
		return table_total
	end 
end 

totals = []
data = []
File.open('casino.txt', 'r') { |file| data = file.readlines}
data.each do |prod|
  ls = prod.split(', ')
  table = Table.new(*ls)
  puts table.highest_day
  totals << table.table_average
end

total = totals.inject(0){|sum,x| sum + x }

print "El promedio total de todas las mesas es #{total / 4}" 