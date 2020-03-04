require_relative "pieza"
require_relative "pieza_vacia"
require_relative "torre"
require_relative "alfil"
require_relative "caballo"
require_relative "rey"
require_relative "dama"
require_relative "peon"


class Tablero	
	
	def self.columna(posicion)		
		('a'..'h').select { |fila| fila != posicion[0] }.map { |fila| "#{fila}#{posicion[1]}" }
	end

	def initialize
		@piezas = {}
		vaciar
	end

	def [](posicion)
		@piezas[posicion]
	end

	def []=(posicion, pieza)
		pieza.tablero = self
		@piezas[posicion] = pieza
	end

	def vaciar
		('a'..'h').each do |fila|
			(1..8).each do |col|
				self["#{fila}#{col}"] = PiezaVacia.new
			end
		end
	end

	def posicion_inicial
		vaciar

		('a'..'h').each do |fila|
			self["#{fila}2"] = Peon.new(:blanco)
			self["#{fila}7"] = Peon.new(:negro)
		end

		self['a1'] = Torre.new(:blanco)
		self['h1'] = Torre.new(:blanco)		
		self['b1'] = Caballo.new(:blanco)
		self['g1'] = Caballo.new(:blanco)		
		self['c1'] = Alfil.new(:blanco)
		self['f1'] = Alfil.new(:blanco)
    self['d1'] = Dama.new(:blanco)
    self['e1'] = Rey.new(:blanco)

		self['a8'] = Torre.new(:negro)
		self['h8'] = Torre.new(:negro)
		self['b8'] = Caballo.new(:negro)
		self['g8'] = Caballo.new(:negro)		
		self['c8'] = Alfil.new(:negro)
		self['f8'] = Alfil.new(:negro)		
    self['d8'] = Dama.new(:negro)
    self['e8'] = Rey.new(:negro)
	end

	def dibujar
		8.downto(1) do |fila|
			('a'..'h').each_with_index do |col, index|
				pieza = self["#{col}#{fila}"].dibujar
				if index.even?
					if fila.even?
						print "\e[44m#{pieza}\e[0m"
					else
						print "\e[46m#{pieza}\e[0m"
					end
				else
					if fila.even?
						print "\e[46m#{pieza}\e[0m"
					else
						print "\e[44m#{pieza}\e[0m"
					end
				end
			end
			puts ' '
		end
	end

	def marcar(posiciones)
		posiciones.each do |posicion|
			self[posicion].marcar = true if self[posicion].vacia?
		end
	end

	def limpia_marcar
		('a'..'h').each do |col|
			(1..8).each do |fila|
				self["#{col}#{fila}"].marcar = false if self["#{col}#{fila}"].vacia?
			end
		end
	end

	def self.columna_izq(posicion)
		fila_izq = posicion[0].ord.pred.chr
		('a'..fila_izq).to_a.reverse.map {|col| "#{col}#{posicion[1]}"}
	end

	def self.columna_der(posicion)
		(posicion[0].next..'h').map {|col| "#{col}#{posicion[1].to_i}"}
	end

	def self.columna(posicion)
		self.columna_izq(posicion) + self.columna_der(posicion)
	end

	def self.fila(posicion)
		self.fila_sup(posicion) + self.fila_inf(posicion)
	end

	def self.fila_sup(posicion)
		(posicion[1].to_i+1..8).map { |fil| "#{posicion[0]}#{fil.to_s}" }
	end

	def self.fila_inf(posicion)
		(1..posicion[1].to_i-1).to_a.reverse.map { |fil| "#{posicion[0]}#{fil.to_s}" }
	end

	def self.diag_der_sup(posicion)
		(posicion[0].next..'h').map.with_index { |fila, i| "#{fila}#{posicion[1].to_i + i + 1}" }.select {|pos| pos[1].to_i <= 8 && pos.size == 2}
	end

	def self.diag_der_inf(posicion)
		(posicion[0].next..'h').map.with_index { |fila, i|  "#{fila}#{posicion[1].to_i - i - 1}" }.select {|pos| pos[1].to_i >= 1}
	end

	def self.diag_izq_sup(posicion)
		fila_izq = posicion[0].ord.pred.chr
			('a'..fila_izq).to_a.reverse.map.with_index { |fila, i| "#{fila}#{posicion[1].to_i + i + 1 }" }.select {|pos| pos[1].to_i <= 8 && pos.size == 2}
	end

	def self.diag_izq_inf(posicion)
		fila_izq = posicion[0].ord.pred.chr
			('a'..fila_izq).to_a.reverse.map.with_index { |fila, i| "#{fila}#{posicion[1].to_i - i - 1 }" }.select {|pos| pos[1].to_i >= 1}
	end

	def self.adjacentes(posicion)
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

	def pieza_origen(jugada)
		piezas = []
		
		if jugada[-1] == '+' && jugada[-2] == '+'
			xy = "#{jugada[-4]}#{jugada[-3]}"
		elsif jugada[-1] == '+'
			xy = "#{jugada[-3]}#{jugada[-2]}"
		else					
			xy = "#{jugada[-2]}#{jugada[-1]}"
		end
		
		('a'..'h').each do |col|
			(1..8).each do |fila|
					unless self["#{col}#{fila}"].vacia?
						piezas << "#{self["#{col}#{fila}"].posicion}" if self["#{col}#{fila}"].movimientos_permitidos.include?(xy) 
					end
			end
		end
	
		piezas.each do |pieza| 
			if jugada[0].match(/[a-h]/)
				puts @piezas[pieza].posicion if @piezas[pieza].class == Peon
			elsif @piezas[pieza].notacion? == jugada[0]
				puts @piezas[pieza].posicion
			end				
		end
  end

  def movimiento(jugada)
  	origen = @piezas[pieza_origen(jugada)[0]].dibujar
   	#@piezas[pieza_origen(jugada)[0]] = PiezaVacia.new

 	end

end