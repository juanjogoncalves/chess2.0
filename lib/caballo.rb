class Caballo < Pieza
	CHAR = '♞'

	def notacion?
		'N'
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
		ant_m = posicion[0].ord.pred.pred.chr
		
		if blanca? || negra?
			if col < 'h' && fila < 7
				ubicacion = @tablero["#{col.next}#{fila + 2}"]
				movimientos << "#{col.next}#{fila + 2}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?)
			end
			if col < 'h' && fila > 1
				ubicacion = @tablero["#{col.next}#{fila - 2}"]
				movimientos << "#{col.next}#{fila - 2}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?)
			end
			if col < 'g' && fila < 7
				ubicacion = @tablero["#{col.next.next}#{fila + 1}"]
				movimientos << "#{col.next.next}#{fila + 1}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?)
			end
			if col < 'g' && fila > 1
				ubicacion = @tablero["#{col.next.next}#{fila - 1}"]
				movimientos << "#{col.next.next}#{fila - 1}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?) 
			end
			if col > 'a' && fila < 7
				ubicacion = @tablero["#{ant}#{fila + 2}"]
				movimientos << "#{ant}#{fila + 2}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?)
			end
			if col > 'a' && fila > 1
				ubicacion = @tablero["#{ant}#{fila - 2}"]
				movimientos << "#{ant}#{fila - 2}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?)
			end
			if col > 'b' && fila < 7
				ubicacion = @tablero["#{ant_m}#{fila + 1}"]
				movimientos << "#{ant_m}#{fila + 1}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?) 
			end
			if col > 'b' && fila > 1
				ubicacion = @tablero["#{ant_m}#{fila - 1}"]
				movimientos << "#{ant_m}#{fila - 1}" if ubicacion.vacia? || (blanca? && ubicacion.negra?) || (negra? && ubicacion.blanca?)
			end
		end
		movimientos
	end	
end