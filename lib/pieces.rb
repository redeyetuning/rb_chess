class Pieces
	attr_accessor :cur_pos, :colour, :moves

	def initialize cur_pos, colour
		@cur_pos = cur_pos
		@colour = colour
		#valid_moves()
	end

	def mv_on_board?(strt, fin)
		true if strt[0] + fin[0] <= 8 or strt[1] + fin[1] <= 8 
	end
end

class Pawn < Pieces

	def valid_move?(strt, fin)
	end
	
end

class Rook < Pieces

	
	def valid_moves
	
		@moves =[]
		
		i = @cur_pos[0] + 1
		while $game.board_state[[i,@cur_pos[1]]].nil? and i<9
			@moves << [i,@cur_pos[1]]
			i += 1
		end
	
		i = @cur_pos[0] - 1
		while $game.board_state[[i,@cur_pos[1]]].nil? and i>0
			@moves << [i,@cur_pos[1]]
			i -= 1
		end
	
		j = @cur_pos[1] + 1
		while $game.board_state[[@cur_pos[0],j]].nil? and j<9
			@moves << [@cur_pos[0],j]
			j += 1
		end
		j = @cur_pos[1] - 1
		while $game.board_state[[@cur_pos[0],j] ].nil? and j>0
			@moves << [@cur_pos[0],j]
			j -= 1
		end

	end 
	


end



class Knight < Pieces

	def valid_move?(strt, fin)
		if 	( (strt[0]-fin[0]).abs == 2 and (strt[1]-fin[1]).abs == 1 ) or 
				( (strt[1]-fin[1]).abs == 2 and (strt[0]-fin[0]).abs == 1 )
			return true
		else return false
		end
	end
	
end

class Bishop < Pieces

	def valid_move?(strt, fin)
		if ( (strt[0]-fin[0]).abs == (strt[1]-fin[1]).abs )
			return true
		else return false
		end 
	end
	
end

class Queen < Pieces
	def valid_move?(strt, fin)
		if 	( (strt[0]-fin[0]).abs <= 8 and (strt[1]-fin[1]).abs == 0 ) or 
				( (strt[1]-fin[1]).abs <= 8 and (strt[0]-fin[0]).abs == 0 ) or
				( (strt[0]-fin[0]).abs == (strt[1]-fin[1]).abs )
			return true
		else return false
		end 
	end 
end

class King < Pieces
	def valid_move?(strt, fin)
		if 	( (strt[0]-fin[0]).abs == 0 and (strt[1]-fin[1]).abs == 1 ) or 
				( (strt[1]-fin[1]).abs == 0 and (strt[0]-fin[0]).abs == 1 ) or
				( (strt[1]-fin[1]).abs == 1 and (strt[0]-fin[0]).abs == 1 )
			return true
		else return false
		end 
	end
end
	