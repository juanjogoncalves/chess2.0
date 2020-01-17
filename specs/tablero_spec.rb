require 'rspec'
require_relative '../lib/tablero.rb'

RSpec.describe Tablero do
	subject(:tablero) { Tablero.new }

	it 'empieza vacío' do
		('a'..'h').each do |fila|
			(1..8).each do |col|
				expect(tablero["#{fila}#{col}"].vacia?).to be_truthy
			end
		end		
	end

	it 'calcula una columna' do
		expect(Tablero.columna('c4')).to eq(['a4', 'b4', 'd4', 'e4', 'f4', 'g4', 'h4'])
	end
end