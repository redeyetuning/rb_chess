require 'board'
require 'pieces'

describe Pieces do
	before do 
			$game = Board.new
			$game.updt_moves
	end

	describe Rook do
		describe "#valid_moves" do
			
			context "White Rook at start position [1,1]" do
				it "returns empty array" do
					expect($game.board_state[[1,1]].moves).to eql([])
				end
			end
			context "White Rook given a start position of [1,3] with all other pieces at home" do
				before do 
					$game.board_state[[1,3]] = Rook.new([1,3], "WHITE", [[1,0],[-1,0],[0,1],[0,-1]])
					$game.board_state[[1,1]] = nil 
					$game.updt_moves
				end
				it "returns an array [[2,3],[3,3],[4,3],[5,3],[6,3],[7,3],[8,3],[1,4],[1,5],[1.6],[1,7]]" do
					expect($game.board_state[[1,3]].moves).to eql([[2,3],[3,3],[4,3],[5,3],[6,3],[7,3],[8,3],[1,4],[1,5],[1,6],[1,7]])
				end
			end
			context "Black Rook given a start position of [1,6] with a white piece at [1,3]" do
				before do 
					$game.board_state[[1,3]] = Rook.new([1,3], "WHITE", [[1,0],[-1,0],[0,1],[0,-1]])
					$game.board_state[[1,6]] = Rook.new([1,6], "BLACK", [[1,0],[-1,0],[0,1],[0,-1]])
					$game.board_state[[1,8]] = nil 
					$game.updt_moves
				end
				it "returns an array [[2,6],[3,6],[4,6],[5,6],[6,6],[7,6],[8,6],[1,5],[1,4],[1,3]]" do
					expect($game.board_state[[1,6]].moves).to eql([[2,6],[3,6],[4,6],[5,6],[6,6],[7,6],[8,6],[1,5],[1,4],[1,3]])
				end
			end		
			
		end
	end

	describe Knight do
		describe "#valid_moves" do

			context "White Knight given at start position [2,1] with all other pieces at home" do
				it "returns an array [3,3],[1,3]" do
					expect($game.board_state[[2,1]].moves).to eql([[3,3],[1,3]])
				end
			end
			context "White Knight given at start position [1,5] with all other pieces at home" do
				before do 
					$game.board_state[[1,5]] = Knight.new([1,5], "WHITE", [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])
					$game.board_state[[2,1]] = nil 
					$game.updt_moves
				end
				it "returns an array [2,3],[2,7],[3,6],[3,4]" do
					expect($game.board_state[[1,5]].moves).to eql([[2,7],[2,3],[3,6],[3,4]])
				end
			end	
			
			context "Black Knight given a start position [3,4] with white piece at [1,5]" do
				before do 
					$game.board_state[[1,5]] = Knight.new([1,5], "WHITE", [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])
					$game.board_state[[2,1]] = nil
					$game.board_state[[3,4]] = Knight.new([3,4], "BLACK", [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])
					$game.board_state[[2,8]] = nil  
					$game.updt_moves
				end
				it "returns an array [4,6],[4,2],[2,6],[2,2],[5,5],[5,3],[1,5],[1,3]" do
					expect($game.board_state[[3,4]].moves).to eql([[4,6],[4,2],[2,6],[2,2],[5,5],[5,3],[1,5],[1,3]])
				end
			end

		end
	end

	describe Bishop do
		describe "#valid_moves" do
			
			context "White Bishop given at start position [3,1]" do
				it "returns empty array" do
					expect($game.board_state[[3,1]].moves).to eql([])
				end
			end
			context "White Bishop given a start position of [3,3] with all other pieces at home" do
				before do 
					$game.board_state[[3,3]] = Bishop.new([3,3],"WHITE", [[1,1],[1,-1],[-1,1],[-1,-1]])
					$game.board_state[[3,1]] = nil 
					$game.updt_moves
				end
				it "returns an array [[4,4],[5,5],[6,6],[7,7],[2,4],[1,5]]" do
					expect($game.board_state[[3,3]].moves).to eql([[4,4],[5,5],[6,6],[7,7],[2,4],[1,5]])
				end
			end
			context "Black Bishop given a start position of [6,6] with a white piece at [3,3]" do
				before do 
					$game.board_state[[3,3]] = Bishop.new([3,3],"WHITE", [[1,1],[1,-1],[-1,1],[-1,-1]])
					$game.board_state[[3,1]] = nil
					$game.board_state[[6,6]] = Bishop.new([6,6],"BLACK", [[1,1],[1,-1],[-1,1],[-1,-1]])
					$game.board_state[[5,8]] = nil 
					$game.updt_moves	
				end
				it "returns an array [[5,5],[4,4],[3,3]]" do
					expect($game.board_state[[6,6]].moves).to eql([[7,5],[8,4],[5,5],[4,4],[3,3]])
				end
			end
			
		end
	end

	describe Queen do
		describe "#valid_moves" do
			
			context "White Queen at start position [4,1]" do
				it "returns empty array" do
					expect($game.board_state[[4,1]].moves).to eql([])
				end
			end
			
			context "White Queen given position [4,3]" do
				before do
					$game.board_state[[4,3]] = Queen.new([4,3],"WHITE",[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
					$game.board_state[[4,1]] = nil 
					$game.updt_moves
				end

				it "returns array [[4,4],[4,5],[4,6],[4,7],[5,4],[6,5],[7,6],[8,7],[5,3],[6,3],[7,3],[8,3],[3,3],[2,3],[1,3],[3,4],[2,5],[1,6]]" do
					expect($game.board_state[[4,3]].moves).to eql([[4,4],[4,5],[4,6],[4,7],[5,4],[6,5],[7,6],[8,7],[5,3],[6,3],[7,3],[8,3],[3,3],[2,3],[1,3],[3,4],[2,5],[1,6]])
				end
			end
			
			context "Black Queen at position [4,6] with White Queen at [4,3]" do
				before do
					$game.board_state[[4,6]] = Queen.new([4,6],"BLACK",[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
					$game.board_state[[5,8]] = nil 
					$game.board_state[[4,3]] = Queen.new([4,3],"WHITE",[[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
					$game.board_state[[4,1]] = nil 
					$game.updt_moves
				end

				it "returns array [[5,6],[6,6],[7,6],[8,6],[5,5],[6,4],[7,3],[8,2],[4,5],[4,4],[4,3],[3,5],[2,4],[1,3],[3,6],[2,6],[1,6]]" do
					expect($game.board_state[[4,6]].moves).to eql([[5,6],[6,6],[7,6],[8,6],[5,5],[6,4],[7,3],[8,2],[4,5],[4,4],[4,3],[3,5],[2,4],[1,3],[3,6],[2,6],[1,6]])
				end
			end

		end
	end

	describe King do
		describe "#valid_move?" do
			
			context "White King at start position [5,1]" do
				it "returns empty array" do
					expect($game.board_state[[5,1]].moves).to eql([])
				end
			end
			
			context "White King at position [5,3]" do
				before do
					$game.board_state[[5,3]] = King.new([5,3],"WHITE", [[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
					$game.board_state[[5,1]] = nil 
					$game.updt_moves
				end

				it "returns array [[5,4],[6,4],[6,3],[4,3],[4,4]]" do
					expect($game.board_state[[5,3]].moves).to eql([[5,4],[6,4],[6,3],[4,3],[4,4]])
				end
			end
			
			context "Black King at position [6,4] with e Queen at [5,3]" do
				before do
					$game.board_state[[5,3]] = King.new([5,3],"WHITE", [[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
					$game.board_state[[5,1]] = nil
					$game.board_state[[6,4]] = King.new([6,4],"BLACK", [[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]])
					$game.board_state[[4,8]] = nil 
					$game.updt_moves
				end

				it "returns array [[6,5],[7,5],[7,4],[7,3],[6,3],[5,3],[5,4],[5,5]]" do
					expect($game.board_state[[6,4]].moves).to eql([[6,5],[7,5],[7,4],[7,3],[6,3],[5,3],[5,4],[5,5]])
				end
			end
			
		end
	end

end