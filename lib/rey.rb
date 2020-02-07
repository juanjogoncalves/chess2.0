class Rey < Pieza
	CHAR = '♚'

	def dibujar
			if blanca?
				"\e[39m#{CHAR}\e[0m"
			else negra? 
				"\e[30m#{CHAR}\e[0m"
			end
	end

	def adjacentes(posicion)
		desde_fila = [posicion[0].ord.pred.chr, 'a'].max
		hasta_fila = [posicion[0].next, 'h'].min
		desde_col  = [posicion[1].to_i - 1, 1].max
		hasta_col  = [posicion[1].to_i + 1, 8].min
		
		adjacentes = []
		(desde_fila..hasta_fila).each do |new_fila|
			(desde_col..hasta_col).each do |new_columna|				
				unless (new_fila == posicion[0] && new_columna == posicion[1].to_i)
					adjacentes << "#{new_fila}#{new_columna}"
				end
			end
		end
		adjacentes
	end	

	def movimientos_permitidos
		adjacentes(posicion).select do |coordenadas|
			posicion = @tablero[coordenadas]
			posicion.vacia? || (blanca? && posicion.negra?) || (negra? && posicion.blanca?)
		end
	end	
end