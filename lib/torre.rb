class Torre < Pieza
	CHAR = '♜'

	def notacion?
		'R'
	end
	
	def dibujar
		if blanca?
			"\e[39m#{CHAR}\e[0m"
		else negra? 
			"\e[30m#{CHAR}\e[0m"
		end
	end

	def movimientos_permitidos
		movimientos = []
		Tablero.columna_izq(posicion).each do |coordenada|
			if @tablero[coordenada].vacia?
				movimientos << coordenada
			elsif (blanca? && @tablero[coordenada].negra?) || (negra? && @tablero[coordenada].blanca?)
				movimientos << coordenada
				break
			else
				break
			end
		end
		Tablero.columna_der(posicion).each do |coordenada|
			if @tablero[coordenada].vacia?
				movimientos << coordenada
			elsif (blanca? && @tablero[coordenada].negra?) || (negra? && @tablero[coordenada].blanca?)
				movimientos << coordenada
				break
			else
				break
			end
		end			
		Tablero.fila_sup(posicion).each do |coordenada|
			if @tablero[coordenada].vacia?
				movimientos << coordenada
			elsif (blanca? && @tablero[coordenada].negra?) || (negra? && @tablero[coordenada].blanca?)
				movimientos << coordenada
				break
			else
				break
			end
		end
		Tablero.fila_inf(posicion).each do |coordenada|
			if @tablero[coordenada].vacia?
				movimientos << coordenada
			elsif (blanca? && @tablero[coordenada].negra?) || (negra? && @tablero[coordenada].blanca?)
				movimientos << coordenada
				break
			else
				break
			end
		end
		movimientos
	end

end