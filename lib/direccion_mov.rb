class Direccion_movida
	
	
	def der
		self + 1
	end

	def der_plus
		self + 2
	end

	def izq
		self - 1
	end

	def izq_plus
		self - 2
	end

	def >(fila)
		@sym > fila
	end

	def >=(fila)
		@sym >= fila
	end

	def <(fila)
		@sym < fila
	end

	def <=(fila)
		@sym <= fila
	end

	def ==(obj)
		if obj.is_a?(Symbol)
			@sym == obj
		else
			super(obj)
		end
	end

	def +(entero)
		i = FILAS.index(@sym) + entero
		if (0..7).include?(i)
			FILAS[i]
		else
			raise ArgumentError.new("#{i} está fuera del tablero")
		end
	end

	def -(entero)
  	i = FILAS.index(@sym) - entero
		if (0..7).include?(i)
			FILAS[i]
		else
			raise ArgumentError.new("#{i} está fuera del tablero")
		end
	end

	def primera?
		@sym == :a
	end

	def ultima?
		@sym == :h
	end
end