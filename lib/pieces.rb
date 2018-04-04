class Pieces
	def initialize
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

	def valid_move?(strt, fin)
	end
	
end

class Knight < Pieces

	def valid_move?(strt, fin)
	end
	
end

class Bishop < Pieces

	def valid_move?(strt, fin)
	end
	
end

class King < Pieces

	def valid_move?(strt, fin)
		true if ( (strt[0]-strt[1]).abs == 0 and (fin[0]-fin[1]).abs == 1 ) or 
						( (strt[0]-strt[1]).abs == 1 and (fin[0]-fin[1]).abs == 0 ) 
	end
end

class Queen < Pieces

	def valid_move?(strt, fin)
		true if ( (strt[0]-fin[0]).abs <= 8 and (strt[1]-strt[1]).abs == 0 ) or 
						( (strt[1]-fin[1]).abs <= 8 and (strt[0]-strt[0]).abs == 0 ) or
						( (strt[0]-fin[0]).abs == (strt[1]-fin[1]).abs ))
	end 

	end
	
end