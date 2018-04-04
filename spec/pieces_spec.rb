require 'pieces'

describe Rook do
	before do 
		@rook = Rook.new
	end

	describe "#valid_move?" do

		context "Given a multi space horizontal move" do
			it "returns true" do
				expect(@rook.valid_move?([1,1],[8,1])).to eql(true)
			end
		end
		context "Given a multi space vertical move" do
			it "returns true" do
				expect(@rook.valid_move?([1,1],[1,8])).to eql(true)
			end
		end	
		context "Given a multi space diagonal move" do
			it "returns false" do
				expect(@rook.valid_move?([1,1],[8,8])).to eql(false)
			end
		end
		context "Given a non straight-line (invalid) move" do
			it "returns false" do
				expect(@rook.valid_move?([1,1],[2,3])).to eql(false)
			end
		end
	end

end

describe Knight do
	before do 
		@knight = Knight.new
	end

	describe "#valid_move?" do

		context "Given a multi space horizontal (invalid)  move" do
			it "returns false" do
				expect(@knight.valid_move?([1,1],[8,1])).to eql(false)
			end
		end
		context "Given a multi space vertical (invalid) move" do
			it "returns false" do
				expect(@knight.valid_move?([1,1],[1,8])).to eql(false)
			end
		end	
		context "Given a multi space diagonal (invalid) move" do
			it "returns false" do
				expect(@knight.valid_move?([1,1],[8,8])).to eql(false)
			end
		end
		context "Given a two up one across move" do
			it "returns true" do
				expect(@knight.valid_move?([1,1],[2,3])).to eql(true)
			end
		end
		context "Given a one up two across move" do
			it "returns true" do
				expect(@knight.valid_move?([1,1],[3,2])).to eql(true)
			end
		end
	end

end

describe Bishop do
	before do 
		@bishop = Bishop.new
	end

	describe "#valid_move?" do

		context "Given a multi space horizontal (invalid) move" do
			it "returns false" do
				expect(@bishop.valid_move?([1,1],[8,1])).to eql(false)
			end
		end
		context "Given a multi space vertical (invalid) move" do
			it "returns false" do
				expect(@bishop.valid_move?([1,1],[1,8])).to eql(false)
			end
		end	
		context "Given a multi space diagonal move" do
			it "returns true" do
				expect(@bishop.valid_move?([1,1],[8,8])).to eql(true)
			end
		end
		context "Given a non straight-line (invalid) move" do
			it "returns false" do
				expect(@bishop.valid_move?([1,1],[2,3])).to eql(false)
			end
		end
	end

end



describe Queen do
	before do 
		@queen = Queen.new
	end

	describe "#valid_move?" do

		context "Given a multi space horizontal move" do
			it "returns true" do
				expect(@queen.valid_move?([1,1],[8,1])).to eql(true)
			end
		end
		context "Given a multi space vertical move" do
			it "returns true" do
				expect(@queen.valid_move?([1,1],[1,8])).to eql(true)
			end
		end	
		context "Given a multi space diagonal move" do
			it "returns true" do
				expect(@queen.valid_move?([1,1],[8,8])).to eql(true)
			end
		end
		context "Given a non straight-line (invalid) move" do
			it "returns false" do
				expect(@queen.valid_move?([1,1],[2,3])).to eql(false)
			end
		end
	end

end

describe King do
	before do 
		@king = King.new
	end

	describe "#valid_move?" do

		context "Given a single space horizontal move" do
			it "returns true" do
				expect(@king.valid_move?([1,1],[2,1])).to eql(true)
			end
		end
		context "Given a single space vertical move" do
			it "returns true" do
				expect(@king.valid_move?([1,1],[1,2])).to eql(true)
			end
		end	
		context "Given a single space diagonal move" do
			it "returns true" do
				expect(@king.valid_move?([2,2],[1,1])).to eql(true)
			end
		end
		context "Given a multiple space (invalid) straight-line move" do
			it "returns false" do
				expect(@king.valid_move?([1,1],[3,3])).to eql(false)
			end
		end
	end

end