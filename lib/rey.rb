class Rey < Pieza
	CHAR = '♚'

	def notacion?
		'K'
	end
	
	def dibujar
			if blanca?
				"\e[39m#{CHAR}\e[0m"
			else negra? 
				"\e[30m#{CHAR}\e[0m"
			end
	end

	def movimientos_permitidos
		Tablero.adjacentes(posicion).select do |coordenadas|
			posicion = @tablero[coordenadas]
			posicion.vacia? || (blanca? && posicion.negra?) || (negra? && posicion.blanca?)
		end
	end	
end