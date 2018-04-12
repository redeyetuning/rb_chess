require 'board'
require 'pieces'

describe Pieces do
	before do 
			$game = Board.new
			$game.updt_moves
	end

	describe Rook do
		
		describe "#valid_moves" do
			context "White piece given a fully constrained position [1,1]" do
				it "returns empty array" do
					expect($game.board_state[[1,1]].moves).to eql([])
				end
			end
			context "White piece given a start position of [1,3] with all other pieces at home" do
				before do 
					$game.board_state[[1,3]] = Rook.new([1,3], "W", [[1,0],[-1,0],[0,1],[0,-1]])
					$game.board_state[[1,1]] = nil 
					$game.updt_moves
				end
				it "returns an array [[2,3],[3,3],[4,3],[5,3],[6,3],[7,3],[8,3],[1,4],[1,5],[1.6],[1,7]]" do
					expect($game.board_state[[1,3]].moves).to eql([[2,3],[3,3],[4,3],[5,3],[6,3],[7,3],[8,3],[1,4],[1,5],[1,6],[1,7]])
				end
			end
			context "Black piece given a start position of [1,6] with a white piece at [1,3]" do
				before do 
					$game.board_state[[1,3]] = Rook.new([1,3], "W", [[1,0],[-1,0],[0,1],[0,-1]])
					$game.board_state[[1,6]] = Rook.new([1,6], "B", [[1,0],[-1,0],[0,1],[0,-1]])
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

			context "White piece given at start position [2,1] with all other pieces at home" do
				it "returns an array [3,3],[1,3]" do
					expect($game.board_state[[2,1]].moves).to eql([[3,3],[1,3]])
				end
			end
			context "White piece given at start position [1,5] with all other pieces at home" do
				before do 
					$game.board_state[[1,5]] = Knight.new([1,5], "W", [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])
					$game.board_state[[2,1]] = nil 
					$game.updt_moves
				end
				it "returns an array [2,3],[2,7],[3,6],[3,4]" do
					expect($game.board_state[[1,5]].moves).to eql([[2,7],[2,3],[3,6],[3,4]])
				end
			end	
			
			context "Black piece given a start position [3,4] with white piece at [1,5]" do
				before do 
					$game.board_state[[1,5]] = Knight.new([1,5], "W", [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])
					$game.board_state[[2,1]] = nil
					$game.board_state[[3,4]] = Knight.new([3,4], "B", [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[2,-1],[-2,1],[-2,-1]])
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
			context "White piece given a fully start position [3,1]" do
				it "returns empty array" do
					expect($game.board_state[[3,1]].moves).to eql([])
				end
			end
			context "White piece given a start position of [3,3] with all other pieces at home" do
				before do 
					$game.board_state[[3,3]] = Bishop.new([3,3],"W", [[1,1],[1,-1],[-1,1],[-1,-1]])
					$game.board_state[[3,1]] = nil 
					$game.updt_moves
				end
				it "returns an array [[4,4],[5,5],[6,6],[7,7],[2,4],[1,5]]" do
					expect($game.board_state[[3,3]].moves).to eql([[4,4],[5,5],[6,6],[7,7],[2,4],[1,5]])
				end
			end
			context "Black piece given a start position of [6,6] with a white piece at [3,3]" do
				before do 
					$game.board_state[[3,3]] = Bishop.new([3,3],"W", [[1,1],[1,-1],[-1,1],[-1,-1]])
					$game.board_state[[3,1]] = nil
					$game.board_state[[6,6]] = Bishop.new([6,6],"B", [[1,1],[1,-1],[-1,1],[-1,-1]])
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

			
		end

	end

	describe King do
		
		describe "#valid_move?" do

			
		end

	end

end