class PiezaVacia
	attr_accessor :tablero, :marcar

	def dibujar
		@marcar ? 'x' : ' '
	end

	def vacia?
		true
	end

	def blanca?
		false
	end

	def negra?
		false
	end
end