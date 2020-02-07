class Pieza
	attr_accessor :tablero
	
	def initialize(color)
		@color = color
	end


	def posicion
		('a'..'h').each do |fila|
			(1..8).each do |col|			
				coordenadas = "#{fila}#{col}"
				return coordenadas if @tablero[coordenadas] == self
			end
		end
	end
	
	def vacia?
		false
	end

	def blanca?
		@color == :blanco
	end

	def negra?
		@color == :negro
	end



end