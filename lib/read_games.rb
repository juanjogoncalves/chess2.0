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

  jugadas = planilla.split(" ").each_slice(2)

  jugadas.each do |terceto|
    break unless STDIN.getch == "\r"

    /(\d+\.)(.+)/.match(terceto[0])

    if $2 == '1-0' || terceto[1] == '1-0'
      puts '1-0'
    elsif $2 == '0-1' || terceto[1] == '0-1'
      puts '0-1'
    elsif $2 == '1/2-1/2' || terceto[1] == '1/2-1/2'
      puts '1/2-1/2'  
    else
       
    puts "#{$1} #{$2} ..."
    
    puts "#{t.movimiento(t, $2, :blanco)}"

    puts "#{$1} ... #{terceto[1]}"
   
    puts "#{t.movimiento(t, terceto[1], :negro)}"
    end
  end
end