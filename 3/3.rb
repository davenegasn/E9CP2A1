r = (1..10).to_a

class Roulette
	def initialize()
		#generar un aleatorio entre 1 y 10
		@r = (1..10).to_a
	end 

	def play(num)
		#obtener el aleatorio generado
		random = @r.sample
		#escribir el aleatorio en roulette_history
		history = File.open('roulette_history.txt', 'a')
		history.puts random 
		history.close
		#si el aleatorio == al numero elegido entonces es ganador
		if random == num
			winner = File.open('winners.txt', 'a')
			winner.puts num 
			winner.close
			print "We have a winner!"
		else  #sino mostrar el numero generado
			puts "NONES: The randon number was #{random} and you picked #{num}"
		end 

	end 

	def history
		
		history = File.open('roulette_history.txt', 'r')
		data = history.readlines
		history.close
		
		most_selected = data.max_by { |i| data.count(i) }
		puts "El valor más generado históricamente es #{most_selected}"
		
	end 

end 

roulette = Roulette.new
roulette.play(9)
roulette.history
