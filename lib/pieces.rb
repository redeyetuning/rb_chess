class Pieces
	attr_accessor :cur_pos, :colour, :moves

	def initialize cur_pos, colour, combos= nil
		@cur_pos = cur_pos
		@colour = colour
		@combos = combos
	end

	def valid_moves 
		@moves = []
		@combos.each do |combo|
			i = @cur_pos[0] + combo[0]	
			j = @cur_pos[1] + combo[1]
			
			while $game.board_state[[i,j]].nil? and i<9 and j<9 and i>0 and j>0
				@moves << [i,j]
				if self.class.name == "King" or self.class.name == "Knight"
					break
				else 
					i += combo[0] 	
					j += combo[1]
				end
			end
		end	
	
	end

end

class Pawn < Pieces

	def valid_move?(strt, fin)
	end
	
end

class Rook < Pieces
	
end

class Knight < Pieces

	def valid_moves
		@moves = []
		@combos.each do |combo|
			new_pos = [@cur_pos[0]+combo[0],@cur_pos[1]+combo[1]]
			@moves << new_pos if $game.board_state[new_pos].nil? and new_pos[0]<9 and new_pos[1]<9 and new_pos[0]>0 and new_pos[1]>0  
		end
	end 
	
end

class Bishop < Pieces

end

class Queen < Pieces
	
end

class King < Pieces
	
end
	