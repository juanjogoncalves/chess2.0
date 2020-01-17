class Alfil < Pieza
	CHAR = '♝'

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
			
			((Fila.new(fila).der)..:h).each_with_index do |fila_destino,i|
				i= i + 1					
				movimientos << [fila_destino, col + i] if @tablero.piezas[fila_destino][col+i ].vacia? || @tablero.piezas[fila_destino][col+i].negra?
				break unless @tablero.piezas[fila_destino][col + i].vacia?
			end

			((Fila.new(fila).der)..:h).each_with_index do |fila_destino,i|
				i= i + 1					
				movimientos << [fila_destino, col - i] if @tablero.piezas[fila_destino][col-i ].vacia? || @tablero.piezas[fila_destino][col-i].negra?
				break unless @tablero.piezas[fila_destino][col - i].vacia?
			end

			(:a..(Fila.new(fila).izq)).reverse_each.with_index do |fila_destino,i|
				i= i + 1					
				movimientos << [fila_destino, col - i] if @tablero.piezas[fila_destino][col-i ].vacia? || @tablero.piezas[fila_destino][col-i].negra?
				break unless @tablero.piezas[fila_destino][col - i].vacia?
			end

			(:a..(Fila.new(fila).izq)).reverse_each.with_index do |fila_destino,i|
				i= i + 1					
				movimientos << [fila_destino, col + i] if @tablero.piezas[fila_destino][col+i ].vacia? || @tablero.piezas[fila_destino][col+i].negra?
				break unless @tablero.piezas[fila_destino][col + i].vacia?
			end

					
		else	
			
			if negra?
			
				((Fila.new(fila).der)..:h).each_with_index do |fila_destino,i|
					i= i + 1					
					movimientos << [fila_destino, col + i] if @tablero.piezas[fila_destino][col+i ].vacia? || @tablero.piezas[fila_destino][col+i].blanca?
					break unless @tablero.piezas[fila_destino][col + i].vacia?
				end

				((Fila.new(fila).der)..:h).each_with_index do |fila_destino,i|
					i= i + 1					
					movimientos << [fila_destino, col - i] if @tablero.piezas[fila_destino][col-i ].vacia? || @tablero.piezas[fila_destino][col-i].blanca?
					break unless @tablero.piezas[fila_destino][col - i].vacia?
				end

				(:a..(Fila.new(fila).izq)).reverse_each.with_index do |fila_destino,i|
					i= i + 1					
					movimientos << [fila_destino, col - i] if @tablero.piezas[fila_destino][col-i ].vacia? || @tablero.piezas[fila_destino][col-i].blanca?
					break unless @tablero.piezas[fila_destino][col - i].vacia?
				end

				(:a..(Fila.new(fila).izq)).reverse_each.with_index do |fila_destino,i|
					i= i + 1					
					movimientos << [fila_destino, col + i] if @tablero.piezas[fila_destino][col+i ].vacia? || @tablero.piezas[fila_destino][col+i].blanca?
					break unless @tablero.piezas[fila_destino][col + i].vacia?
				end
			
			end
		
		end
		movimientos
	end

end