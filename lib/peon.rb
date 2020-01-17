class Peon < Pieza
	CHAR = '♟'

	def dibujar
		if blanca?
			"\e[39m#{CHAR}\e[0m"
		else negra? 
			"\e[30m#{CHAR}\e[0m"
		end
	end

	def movimientos_permitidos
		movimientos = []
		fila, col = posicion
		if blanca?
			
			movimientos << [fila, col + 1] if @tablero.piezas[fila][col + 1].vacia?
			movimientos << [fila, col + 2] if col == 1 && @tablero.piezas[fila][col + 2].vacia? && @tablero.piezas[fila][col + 1].vacia?

			if fila < :h && col < 7 && @tablero.piezas[Fila.new(fila).der][col + 1].negra?
				movimientos << [Fila.new(fila).der, col + 1]
			end
			if fila > :a && col < 7 && @tablero.piezas[Fila.new(fila).izq][col + 1].negra?
				movimientos << [Fila.new(fila).izq, col + 1]
			end

		else
			if negra?
				
				movimientos << [fila, col - 1] if @tablero.piezas[fila][col - 1].vacia?
				movimientos << [fila, col - 2] if col == 6 && @tablero.piezas[fila][col - 2].vacia? && @tablero.piezas[fila][col - 1].vacia?

				if fila < :h && col > 0 && @tablero.piezas[Fila.new(fila).der][col - 1].blanca?
					movimientos << [Fila.new(fila).der, col - 1]
				end
				if fila > :a && col > 0 && @tablero.piezas[Fila.new(fila).izq][col - 1].blanca? 
					movimientos << [Fila.new(fila).izq, col - 1] 
				end

			end
		end
		movimientos
	end	
end