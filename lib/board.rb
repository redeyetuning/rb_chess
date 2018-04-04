# This class tracks the progress of an ongoing Chess game, including position of the pieces.
class Board

	attr_accessor :board_state

	def initialize
		populate_board
	end

	def populate_board
		tiles = [*1..8].repeated_permutation(2).to_a.map{|x| "#{(x[0]+96).chr}#{x[1]}"} #Array from "a1" -> "h8"
		@board_state = Hash[tiles.map{|tile| [tile, nil]}]

		["a2","b2","c2","d2","e2","f2","g2","h2"].each {|tile| @board_state[tile] = 'Pawn.new("W")'}
		["a1","h1"].each {|tile| @board_state[tile] = 'Rook.new("W")'}
		["b1","g1"].each {|tile| @board_state[tile] = 'Knight.new("W")'}
		["c1","f1"].each {|tile| @board_state[tile] = 'Bishop.new("W")'}
		@board_state["e1"] = 'King.new("W")'
		@board_state["d1"] = 'Queen.new("W")'

		["a7","b7","c7","d7","e7","f7","g7","h7"].each {|tile| @board_state[tile] = 'Pawn.new("B")'}
		["a8","h8"].each {|tile| @board_state[tile] = 'Rook.new("B")'}
		["b8","g8"].each {|tile| @board_state[tile] = 'Knight.new("B")'}
		["c8","f8"].each {|tile| @board_state[tile] = 'Bishop.new("B")'}
		@board_state["d8"] = 'King.new("B")'
		@board_state["e8"] = 'Queen.new("B")'
	end

end