class Pieces
	attr_accessor :cur_pos, :colour, :moves, :ref

	def initialize cur_pos, colour, combos= nil
		@cur_pos = cur_pos
		@colour = colour
		@combos = combos
		if self.class.name == "King"
			@ref = "#{colour[0]}+"
		else
			@ref = "#{colour[0]}#{self.class.name[0]}" 
		end
	end

	def valid_moves 
		@moves = []
		@combos.each do |combo|
			i = @cur_pos[0] + combo[0]	
			j = @cur_pos[1] + combo[1]
			
			while ($act_board.board_state[[i,j]].nil? or $act_board.board_state[[i,j]].colour !=self.colour) and i<9 and j<9 and i>0 and j>0

				@moves << [i,j]
				if self.class.name == "King" or self.class.name == "Knight"
					break
				elsif $act_board.board_state[[i,j]] != nil
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

	def valid_moves
		@moves =[]
		self.colour == "WHITE" ? i = 1 : i = -1
		if $act_board.board_state[[@cur_pos[0], @cur_pos[1]+(i)]].nil? and @cur_pos[1]+(i) < 9 
				@moves << [@cur_pos[0], @cur_pos[1]+(i)]
				if ((@cur_pos[1] == 2 && self.colour == "WHITE") or (@cur_pos[1] == 7 && self.colour == "BLACK")) and $act_board.board_state[[@cur_pos[0], @cur_pos[1]+(2*i)]].nil?
					@moves << [@cur_pos[0], @cur_pos[1]+(2*i)]
				end
		end

		@moves << [@cur_pos[0] + 1, @cur_pos[1]+(i)] if $act_board.board_state[[@cur_pos[0]+1 , @cur_pos[1]+(i)]] !=nil and @cur_pos[0]+1 < 9 and @cur_pos[1]+(i) < 9 and @cur_pos[1]+(i) > 0 
		@moves << [@cur_pos[0] - 1, @cur_pos[1]+(i)] if $act_board.board_state[[@cur_pos[0]-1 , @cur_pos[1]+(i)]] !=nil and @cur_pos[0]-1 > 0 and @cur_pos[1]+(i) < 9 and @cur_pos[1]+(i) > 0

	end
	
end

class Rook < Pieces
	
end

class Knight < Pieces
	
end

class Bishop < Pieces

end

class Queen < Pieces
	
end

class King < Pieces
	
end
	