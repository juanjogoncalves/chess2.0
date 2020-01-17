class Dama < Pieza
	CHAR = '♛'

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

			((col + 1)..7).each_with_index do |col_destino|
				movimientos << [fila, col_destino] if @tablero.piezas[fila][col_destino].vacia? || @tablero.piezas[fila][col_destino].negra?
				break unless @tablero.piezas[fila][col_destino].vacia?
			end

			((col - 1).downto 0).each do |col_destino|
				movimientos << [fila, col_destino] if @tablero.piezas[fila][col_destino].vacia? || @tablero.piezas[fila][col_destino].negra?
				break unless @tablero.piezas[fila][col_destino].vacia?
			end

			((Fila.new(fila).der)..:h).each do |fila_destino|
				movimientos << [fila_destino, col] if @tablero.piezas[fila_destino][col].vacia? || @tablero.piezas[fila_destino][col].negra?
				break unless @tablero.piezas[fila_destino][col].vacia?
			end

			(:a..(Fila.new(fila).izq)).reverse_each do |fila_destino|
				movimientos << [fila_destino, col] if @tablero.piezas[fila_destino][col].vacia? || @tablero.piezas[fila_destino][col].negra?
				break unless @tablero.piezas[fila_destino][col].vacia?
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

			((col + 1)..7).each do |col_destino|
				movimientos << [fila, col_destino] if @tablero.piezas[fila][col_destino].vacia? || @tablero.piezas[fila][col_destino].blanca?
				break unless @tablero.piezas[fila][col_destino].vacia?
			end

			((col - 1).downto 0).each do |col_destino|
				movimientos << [fila, col_destino] if @tablero.piezas[fila][col_destino].vacia? || @tablero.piezas[fila][col_destino].blanca?
				break unless @tablero.piezas[fila][col_destino].vacia?
			end

			((Fila.new(fila).der)..:h).each do |fila_destino|
				movimientos << [fila_destino, col] if @tablero.piezas[fila_destino][col].vacia? || @tablero.piezas[fila_destino][col].blanca?
				break unless @tablero.piezas[fila_destino][col].vacia?
			end

			(:a..(Fila.new(fila).izq)).reverse_each do |fila_destino|
				movimientos << [fila_destino, col] if @tablero.piezas[fila_destino][col].vacia? || @tablero.piezas[fila_destino][col].blanca?
				break unless @tablero.piezas[fila_destino][col].vacia?
			end

			end
		end
			movimientos

	end
end