class Partida
	def initialize
		@jugadas = []
	end

	def jugadas(numero)
		@jugadas[numero - 1]
	end

  def cantidad_jugadas
    @jugadas.length
  end

	def blancas_juegan(jugada)
		@jugadas << Jugada.new(jugador_blanco: jugada)
	end

	def negras_juegan(jugada)
		@jugadas.last.jugador_negro = jugada
	end

	def reproducir
	  tablero = Tablero.new
	  1.upto(cantidad_jugadas) do |numero|
	    movida_blanco = jugadas(numero).jugador_blanco
	    tablero.mover(movida_blanco[0], movida_blanco[1])
	    tablero.dibujar
	    puts "#{numero}. #{movida_blanco}"
	    puts "Presione ENTER para avanzar a la siguiente jugada"
	    teclado = STDIN.getch
	      if teclado == "\r"
	        system 'clear'
	      end
	    puts ''
	    
	    if jugadas(numero).jugador_negro
	      movida_negro = jugadas(numero).jugador_negro
	      tablero.mover(movida_negro[0], movida_negro[1])
	      tablero.dibujar
	      puts "#{numero}. ... #{movida_negro}"
	      puts "Presione ENTER para avanzar a la siguiente jugada"
	      teclado = STDIN.getch
	      if teclado == "\r"
	        system 'clear'
	      end           
	    end

	    puts ''
	  end
	end
end