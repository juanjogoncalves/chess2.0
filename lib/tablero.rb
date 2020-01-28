require_relative "pieza"
require_relative "pieza_vacia"
require_relative "peon"
require_relative "torre"
require_relative "alfil"
require_relative "caballo"
require_relative "dama"
require_relative "rey"

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
    self["d1"] = Dama.new(:blanco)
    self["e1"] = Rey.new(:blanco)

		self['a8'] = Torre.new(:negro)
		self['h8'] = Torre.new(:negro)
		self['b8'] = Caballo.new(:negro)
		self['g8'] = Caballo.new(:negro)		
		self['c8'] = Alfil.new(:negro)
		self['f8'] = Alfil.new(:negro)		
    self["d8"] = Dama.new(:negro)
    self["e8"] = Rey.new(:negro)
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

	def columna(posicion)		
		('a'..'h').select { |fila| fila != posicion[0] }.map { |fila| "#{fila}#{posicion[1]}" }
	end

	def columna_min(posicion)	
	fila_izq = posicion[0].ord.pred.chr	
		('a'..'h').select { |fila| fila != posicion[0] }.map { |fila| "#{fila}#{posicion[1]}" }.select {|pos| pos[0] == posicion[0].next || pos[0] == fila_izq }
	end

	def fila(posicion)
		(1..8).reject { |col| (col.to_s == posicion[1]) }.map { |col| "#{posicion[0]}#{col}" }
	end

	def fila_min(posicion)
		(1..8).reject { |col| (col.to_s == posicion[1]) }.map { |col| "#{posicion[0]}#{col}" }.select {|pos| pos[1].to_i == posicion[1].to_i + 1 || pos[1].to_i == posicion[1].to_i - 1 }
	end

	def diag_der_sup(posicion)
		(posicion[0].next..'h').map.with_index { |fila, i| "#{fila}#{posicion[1].to_i + i + 1}" }.select {|pos| pos[1].to_i <= 8}
	end

	def diag_der_sup_min(posicion)
		(posicion[0].next..'h').map.with_index { |fila, i| "#{fila}#{posicion[1].to_i + i + 1}" }.select {|pos| pos[1].to_i == posicion[1].to_i + 1 && pos[1].to_i <= 8}
	end

	def diag_der_inf(posicion)
		(posicion[0].next..'h').map.with_index { |fila, i|  "#{fila}#{posicion[1].to_i - i - 1}" }.select {|pos| pos[1].to_i >= 1}
	end

	def diag_der_inf_min(posicion)
		(posicion[0].next..'h').map.with_index { |fila, i|  "#{fila}#{posicion[1].to_i - i - 1}" }.select {|pos| pos[1].to_i == posicion[1].to_i - 1 && pos[1].to_i >= 1}
	end

	def diag_izq_sup(posicion)
		fila_izq = posicion[0].ord.pred.chr
			('a'..fila_izq).to_a.reverse.map.with_index { |fila, i| "#{fila}#{posicion[1].to_i + i + 1 }" }.select {|pos| pos[1].to_i <= 8}
	end

	def diag_izq_sup_min(posicion)
		fila_izq = posicion[0].ord.pred.chr
			('a'..fila_izq).to_a.reverse.map.with_index { |fila, i| "#{fila}#{posicion[1].to_i + i + 1 }" }.select {|pos| pos[1].to_i == posicion[1].to_i + 1 && pos[1].to_i <= 8}
	end

	def diag_izq_inf(posicion)
		fila_izq = posicion[0].ord.pred.chr
			('a'..fila_izq).to_a.reverse.map.with_index { |fila, i| "#{fila}#{posicion[1].to_i - i - 1 }" }.select {|pos| pos[1].to_i >= 1}
	end

	def diag_izq_inf_min(posicion)
		fila_izq = posicion[0].ord.pred.chr
			('a'..fila_izq).to_a.reverse.map.with_index { |fila, i| "#{fila}#{posicion[1].to_i - i - 1 }" }.select {|pos| pos[1].to_i == posicion[1].to_i - 1 && pos[1].to_i >= 1}
	end
end