class Rey < Pieza
	CHAR = '♚'

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

				if fila < :h
					movimientos << [Fila.new(fila).der, col] unless @tablero.piezas[Fila.new(fila).der][col].blanca? 
				end
				if fila > :a
					movimientos << [Fila.new(fila).izq, col] unless @tablero.piezas[Fila.new(fila).izq][col].blanca? 
				end
				if col < 7
					movimientos << [fila, col + 1] unless @tablero.piezas[fila][col + 1].blanca? 
				end
				if col > 0
					movimientos << [fila, col - 1] unless @tablero.piezas[fila][col - 1].blanca? 
				end
				if col < 7	&& fila > :a 	
					movimientos << [Fila.new(fila).izq, col + 1] unless @tablero.piezas[Fila.new(fila).izq][col + 1].blanca?
				end
				if col < 7 && fila < :h
					movimientos << [Fila.new(fila).der, col + 1] unless @tablero.piezas[Fila.new(fila).der][col + 1].blanca?
				end
				if col > 0 && fila > :a 
					movimientos << [Fila.new(fila).izq, col - 1] unless @tablero.piezas[Fila.new(fila).izq][col - 1].blanca? 
				end
				if col > 0 && fila < :h
						movimientos << [Fila.new(fila).der, col - 1] unless @tablero.piezas[Fila.new(fila).der][col - 1].blanca? 
				end
				
				
			else
	
			if negra?
				
				if fila < :h
					movimientos << [Fila.new(fila).der, col] unless @tablero.piezas[Fila.new(fila).der][col].negra? 
				end
				if fila > :a
					movimientos << [Fila.new(fila).izq, col] unless @tablero.piezas[Fila.new(fila).izq][col].negra? 
				end
				if col < 7
					movimientos << [fila, col + 1] unless @tablero.piezas[fila][col + 1].negra? 
				end
				if col > 0
					movimientos << [fila, col - 1] unless @tablero.piezas[fila][col - 1].negra? 
				end
				if col < 7	&& fila > :a 	
					movimientos << [Fila.new(fila).izq, col + 1] unless @tablero.piezas[Fila.new(fila).izq][col + 1].negra?
				end
				if col < 7 && fila < :h
					movimientos << [Fila.new(fila).der, col + 1] unless @tablero.piezas[Fila.new(fila).der][col + 1].negra?
				end
				if col > 0 && fila > :a 
					movimientos << [Fila.new(fila).izq, col - 1] unless @tablero.piezas[Fila.new(fila).izq][col - 1].negra? 
				end
				if col > 0 && fila < :h
						movimientos << [Fila.new(fila).der, col - 1] unless @tablero.piezas[Fila.new(fila).der][col - 1].negra? 
				end
				
			end
		end
		movimientos
	end	

end