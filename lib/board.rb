# This class tracks the progress of an ongoing Chess game, including position of the pieces.
class Board

	attr_accessor :board_state

	def initialize
		populate_board
	end

	def populate_board
		tiles = [*1..8].repeated_permutation(2).to_a #Array from "1,1" -> "8,8"
		@board_state = Hash[tiles.map{|tile| [tile, nil]}]

		[[1,2],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2],[8,2]].each {|tile| @board_state[tile] = 'Pawn.new("W")'}
		[[1,1],[8,1]].each {|tile| @board_state[tile] = 'Rook.new("W")'}
		[[2,1],[7,1]].each {|tile| @board_state[tile] = 'Knight.new("W")'}
		[[3,1],[6,1]].each {|tile| @board_state[tile] = 'Bishop.new("W")'}
		@board_state[[5,1]] = 'King.new("W")'
		@board_state[[4,1]] = 'Queen.new("W")'

		[[1,7],[2,7],[3,7],[4,7],[5,7],[6,7],[7,7],[8,7]].each {|tile| @board_state[tile] = 'Pawn.new("B")'}
		[[1,8],[8,8]].each {|tile| @board_state[tile] = 'Rook.new("B")'}
		[[2,8],[7,8]].each {|tile| @board_state[tile] = 'Knight.new("B")'}
		[[3,8],[6,8]].each {|tile| @board_state[tile] = 'Bishop.new("B")'}
		@board_state[[4,8]] = 'King.new("B")'
		@board_state[[5,8]] = 'Queen.new("B")'
	end

	def alphnum_coord_trnslt (alph_num_coord)
		[alph_num_coord[0].ord-96, alph_num_coord[1].to_i]
	end

	def coord_alphnum_trnslt (coord)
		(coord[0]+96).chr + coord[1].to_s
	end

end