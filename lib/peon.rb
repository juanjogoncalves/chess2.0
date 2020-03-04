class Peon < Pieza
	CHAR = '♟'

	def notacion?
		' '
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
		col = posicion[0]
		fila = posicion[1].to_i
		ant = posicion[0].ord.pred.chr
		if blanca?
		
			movimientos << "#{col}#{fila+1}" if @tablero["#{col}#{fila+1}"].vacia?
			movimientos << "#{col}#{fila+2}" if @tablero["#{col}#{fila+1}"].vacia? && tablero["#{col}#{fila+2}"].vacia? if fila == 2 
			if col < 'h' && fila < 8 && @tablero["#{col.next}#{fila+1}"].negra?
				movimientos << "#{col.next}#{fila+1}"
			end
			if col > 'a' && fila < 8 && @tablero["#{ant}#{fila+1}"].negra?
				movimientos << "#{ant}#{fila+1}"
			end

			elsif negra?
			
			movimientos << "#{col}#{fila-1}" if @tablero["#{col}#{fila-1}"].vacia?
			movimientos << "#{col}#{fila-2}" if @tablero["#{col}#{fila-1}"].vacia? && tablero["#{col}#{fila-2}"].vacia? if fila == 7 
			if col < 'h' && fila > 1 && @tablero["#{col.next}#{fila-1}"].blanca?
				movimientos << "#{col.next}#{fila-1}"
			end
			if col > 'a' && fila > 1 && @tablero["#{ant}#{fila-1}"].blanca?
				movimientos << "#{ant}#{fila-1}"
			end			
		end
		movimientos
	end	
end