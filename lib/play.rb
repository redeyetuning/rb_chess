require_relative 'board'
require_relative 'pieces'
require 'yaml'
class Chess
	
	def self.load
		if File.exists?('save_game.dump') 
			$game = YAML.load_file('save_game.dump')
			puts "             <- Game Loaded ->\n\n"
		else 
			puts "Sorry there is no saved game. Starting a new game instead."
			$game = Board.new
			puts "             <- Game Started ->\n\n"
		end
	end

	def self.intro
		puts "Welcome to REDEYE Chess 2018\n\nWould you like to start a (N)ew game or (L)oad a saved one?"
		gets.chomp.downcase == "l" ? load : $game = Board.new and puts "             <- Game Started ->\n\n"
		puts "Type (S) at any time to Save your game\n\n"  
		$act_board = $game
		$game.updt_moves
		$game.disp_board
	end
end

Chess.intro



loop do 
	$game.turn_colour
	$game.make_move
	$game.turns += 1
end
