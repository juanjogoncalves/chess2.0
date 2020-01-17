class Caballo < Pieza
	CHAR = '♞'

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
			if fila < :h && col < 6
				movimientos << [Fila.new(fila).der, col + 2] unless @tablero.piezas[Fila.new(fila).der][col + 2].blanca?
			end
			if fila < :h && col > 1
				movimientos << [Fila.new(fila).der, col - 2] unless @tablero.piezas[Fila.new(fila).der][col - 2].blanca?
			end
			if fila < :g && col < 7
				movimientos << [Fila.new(fila).der_plus, col + 1] unless @tablero.piezas[Fila.new(fila).der_plus][col + 1].blanca?
			end
			if fila < :g && col > 0
				movimientos << [Fila.new(fila).der_plus, col - 1] unless @tablero.piezas[Fila.new(fila).der_plus][col - 1].blanca?
			end
			if fila > :a && col < 6
				movimientos << [Fila.new(fila).izq, col + 2] unless @tablero.piezas[Fila.new(fila).izq][col + 2].blanca?
			end
			if fila > :a && col > 1
				movimientos << [Fila.new(fila).izq, col - 2] unless @tablero.piezas[Fila.new(fila).izq][col - 2].blanca?
			end
			if fila > :b && col < 7
				movimientos << [Fila.new(fila).izq_plus, col + 1] unless @tablero.piezas[Fila.new(fila).izq_plus][col + 1].blanca?
			end
			if fila > :b && col > 0
				movimientos << [Fila.new(fila).izq_plus, col - 1] unless @tablero.piezas[Fila.new(fila).izq_plus][col - 1].blanca?
			end
			
		else
			if negra?
						if fila < :h && col < 6
							movimientos << [Fila.new(fila).der, col + 2] unless @tablero.piezas[Fila.new(fila).der][col + 2].negra?
						end
						if fila < :h && col > 1
							movimientos << [Fila.new(fila).der, col - 2] unless @tablero.piezas[Fila.new(fila).der][col - 2].negra?
						end
						if fila < :g && col < 7
							movimientos << [Fila.new(fila).der_plus, col + 1] unless @tablero.piezas[Fila.new(fila).der_plus][col + 1].negra?
						end
						if fila < :g && col > 0
							movimientos << [Fila.new(fila).der_plus, col - 1] unless @tablero.piezas[Fila.new(fila).der_plus][col - 1].negra?
						end
						if fila > :a && col < 6
							movimientos << [Fila.new(fila).izq, col + 2] unless @tablero.piezas[Fila.new(fila).izq][col + 2].negra?
						end
						if fila > :a && col > 1
							movimientos << [Fila.new(fila).izq, col - 2] unless @tablero.piezas[Fila.new(fila).izq][col - 2].negra?
						end
						if fila > :b && col < 7
							movimientos << [Fila.new(fila).izq_plus, col + 1] unless @tablero.piezas[Fila.new(fila).izq_plus][col + 1].negra?
						end
						if fila > :b && col > 0
							movimientos << [Fila.new(fila).izq_plus, col - 1] unless @tablero.piezas[Fila.new(fila).izq_plus][col - 1].negra?
						end
			end		
		end
		movimientos
	end	
end