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
		ant = posicion[0].ord.pred.chr
		if blanca?
		
			movimientos << "#{posicion[0]}#{posicion[1].to_i+1}" if @tablero["#{posicion[0]}#{posicion[1].to_i+1}"].vacia?
			movimientos << "#{posicion[0]}#{posicion[1].to_i+2}" if @tablero["#{posicion[0]}#{posicion[1].to_i+1}"].vacia? 
																															&& tablero["#{posicion[0]}#{posicion[1].to_i-2}"].vacia? 
			if posicion[0] < 'h' && posicion[1].to_i < 8 && @tablero["#{posicion[0].next}#{posicion[1].to_i+1}"].negra?
				movimientos << "#{posicion[0].next}#{posicion[1].to_i+1}"
			end
			if posicion[0] > 'a' && posicion[1].to_i < 8 && @tablero["#{ant}#{posicion[1].to_i+1}"].negra?
				movimientos << "#{ant}#{posicion[1].to_i+1}"
			end

		elsif negra?
			
			movimientos << "#{posicion[0]}#{posicion[1].to_i-1}" if @tablero["#{posicion[0]}#{posicion[1].to_i-1}"].vacia?
			movimientos << "#{posicion[0]}#{posicion[1].to_i-2}" if @tablero["#{posicion[0]}#{posicion[1].to_i-1}"].vacia? 
																														&& tablero["#{posicion[0]}#{posicion[1].to_i-2}"].vacia? 
			if posicion[0] < 'h' && posicion[1].to_i < 8 && @tablero["#{posicion[0].next}#{posicion[1].to_i-1}"].blanca?
				movimientos << "#{posicion[0].next}#{posicion[1].to_i-1}"
			end
			if posicion[0] > 'a' && posicion[1].to_i < 8 && @tablero["#{ant}#{posicion[1].to_i+1}"].blanca?
				movimientos << "#{ant}#{posicion[1].to_i-1}"
			end
		end
		movimientos
	end	
end