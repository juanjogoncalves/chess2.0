require_relative "tablero"
require_relative "pieza"
require_relative "pieza_vacia"
require_relative "torre"
require_relative "alfil"
require_relative "caballo"
require_relative "rey"
require_relative "dama"
require_relative "peon"

require 'io/console'

t = Tablero.new
t.posicion_inicial

unless ARGV[0]
  puts "Use with read_png <game>"
  exit
end

puts "Presione Enter para pasar de jugada"

File.readlines(ARGV[0]).each do |planilla|
  jugadas = planilla.split(" ").each_slice(3)

  jugadas.each do |terceto|
    break unless STDIN.getch == "\r"
    puts "#{terceto[0]} #{terceto[1]} #{terceto[2]}"
    
    puts "encontrado: #{t.movimiento(t, terceto[1], :blanco)}"
   
    puts "encontrado: #{t.movimiento(t, terceto[2], :negro)}"
    
  end
end