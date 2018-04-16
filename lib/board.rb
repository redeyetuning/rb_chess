# This class tracks the progress of an ongoing Chess , including position of the pieces.
require_relative 'pieces'

class Board

	attr_accessor :board_state, :turns, :turn_colour, :b_king_pos, :w_king_pos 

	def initialize
		@turns = 0
		populate_board
	end

	#def initialize_copy(source)
  #		super
  #		@board_state = source.board_state.dup
  #		@b_king_pos = source.b_king_pos.dup
	#		@w_king_pos = source.w_king_pos.dup
	#end

	def populate_board
		tiles = [*1..8].repeated_permutation(2).to_a #Array from "1,1" -> "8,8"
		@board_state = Hash[tiles.map{|tile| [tile, nil]}]

		[[1,2],[2,2],[3,2],[4,2],[5,2],[6,2],[7,2],[8,2]].each {|tile| @board_state[tile] = Pawn.new(tile, "WHITE")}
		[[1,1],[8,1]].each {|tile| @board_state[tile] = Rook.new(tile, "WHITE", [[1,0],[-1,0],[0,1],[0,-1]])}
		[[2,1],[7,1]].each {|tile| @board_state[tile] = Knight.new(tile, "WHITE", [[1,2], [1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])}
		[[3,1],[6,1]].each {|tile| @board_state[tile] = Bishop.new(tile,"WHITE", [[1,1],[1,-1],[-1,1],[-1,-1]])}
		@board_state[[4,1]] = Queen.new([4,1], "WHITE",[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
		@board_state[[5,1]] = King.new([5,1],"WHITE", [[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
		@w_king_pos = [5,1]

		[[1,7],[2,7],[3,7],[4,7],[5,7],[6,7],[7,7],[8,7]].each {|tile| @board_state[tile] = Pawn.new(tile,"BLACK")}
		[[1,8],[8,8]].each {|tile| @board_state[tile] = Rook.new(tile,"BLACK", [[1,0],[-1,0],[0,1],[0,-1]])}
		[[2,8],[7,8]].each {|tile| @board_state[tile] = Knight.new(tile,"BLACK", [[1,2], [1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])}
		[[3,8],[6,8]].each {|tile| @board_state[tile] = Bishop.new(tile,"BLACK", [[1,1],[1,-1],[-1,1],[-1,-1]])}
		@board_state[[5,8]] = Queen.new([5,8],"BLACK",[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
		@board_state[[4,8]] = King.new([4,8],"BLACK",[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
		@b_king_pos = [4,8]	
	end

	def turn_colour
		(@turns == 0 or @turns%2 == 0) ?  (@turn_colour = "WHITE") : (@turn_colour = "BLACK")
	end


	def disp_board
		print "     1    2    3    4    5    6    7    8  \n"
		print "  -----------------------------------------\n" 
		y = 8
		8.times do
			print "#{y} " 
			(1..8).each {|x| 
				if @board_state[[x,y]] != nil
					print "| #{$act_board.board_state[[x,y]].ref} "
				else  
					print "|    "  
				end
			}
			print "| #{y}\n   -----------------------------------------\n"
			y -=1
		end
		print "     1    2    3    4    5    6    7    8 \n\n"
	end

	def updt_moves
		@board_state.each {|key, value| value.valid_moves unless value.nil?}
	end

	def get_move (type)
		puts "Enter the #{type} coordinate of your move:"
		gets.chomp.split(",").map{|x| x.to_i}
	end

	def correct_strt? (coord)
		(@turns == 0 or @turns%2 == 0) ? turn_colour = "WHITE" : turn_colour = "BLACK"
		
		if coord == nil
			false	
		elsif @board_state[coord].nil?
			puts "There isn't a piece at that coordinate, please try again!"  
		elsif @board_state[coord].colour != turn_colour
			puts "It's not that players turn!" 
		else
			true
		end
				
	end

	def make_move
		@turn_colour == "WHITE" ? opp = "BLACK" : opp = "WHITE"
		puts "-> #{@turn_colour} TURN <-\n\n"
		loop do
			strt = get_move("start") until correct_strt?(strt) 
			fin = get_move("target")
		
			if @board_state[strt].moves.include?(fin)
				@board_state[fin] = @board_state[strt]
				@board_state[fin].cur_pos = fin
				@board_state[strt] = nil
				if @board_state[fin].class.name == "King"
					@turn_colour == "BLACK" ? @b_king_pos = fin : @w_king_pos = fin
				end
				break
			else
				puts	"That is an invalid move, please try again."
			end
		end
		updt_moves
		disp_board
		puts "#{opp} is in check!" if in_check?(opp) 
		puts "#{opp} is in checkmate!" if in_checkmate?(opp)
		$act_board = $game
		
	end

	def in_check? colour
		colour == "BLACK" ? pos = b_king_pos : pos = w_king_pos
		@board_state.any? do |key, value|
			if value != nil and value.colour != colour
				value.moves.include?(pos)
			end 
		end		

	end

	def in_checkmate? colour
		colour == "BLACK" ? pos = b_king_pos : pos = w_king_pos
		return false if @board_state[pos].moves == [] 
		@board_state[pos].moves.all? do |move|
				test_board = Marshal::load(Marshal.dump($act_board))
				$act_board = test_board
				test_board.board_state[move] = test_board.board_state[pos]
				test_board.board_state[move].cur_pos = move
				test_board.board_state[pos]=nil
				colour == "WHITE" ? test_board.w_king_pos = move : test_board.b_king_pos = move
				test_board.updt_moves
				test_board.in_check?(colour)					
		end

	end

	def alphnum_coord_trnslt (alph_num_coord)
		[alph_num_coord[0].ord-96, alph_num_coord[1].to_i]
	end

	def coord_alphnum_trnslt (coord)
		(coord[0]+96).chr + coord[1].to_s
	end

end