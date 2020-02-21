class Jugada

	attr_accessor :jugador_blanco , :jugador_negro , :tablero

	def initialize(jugador_blanco:, jugador_negro: nil)
		@jugador_blanco = jugador_blanco
    @jugador_negro = jugador_negro
	end

  def to_s
    "#{@jugador_blanco} - #{@jugador_negro}"
  end

  
  				
end