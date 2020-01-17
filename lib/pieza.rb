class Pieza
	attr_accessor :tablero

	def initialize(color)
		@color = color
	end

	def posicion
		@tablero.piezas.each_pair do |fila, columnas|
			columnas.each_with_index do |pieza, columna|
				return [fila, columna ] if pieza == self
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