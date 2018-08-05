class Course
	#constructor
	def initialize(curso, inicio, termino)
		@curso 	= curso 
		@inicio = inicio 
		@termino = termino 
	end 
	
	#cursos previos a la fecha dada
	def previos(fecha_inicio = "2018-08-01")
		if fecha_inicio >= "2018-01-01"
			print "Error fecha muy lejana"
		else 
			puts "#{@curso}" if @inicio < fecha_inicio
		end 
	end 

	#cursos posteriores a la fecha dada
	def posteriores(fecha_termino = "2018-08-01")
		if fecha_termino >= "2018-01-01"
			print "Error fecha muy lejana"
		else 
			puts "#{@curso}" if @termino > fecha_termino
		end 
	end
end 


data = []
File.open('cursos.txt', 'r') { |file| data = file.readlines}
data.each do |prod|
  ls = prod.split(', ')
  course = Course.new(*ls)
  puts course.posteriores("2017-11-04")
end