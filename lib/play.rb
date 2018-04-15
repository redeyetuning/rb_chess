require_relative 'board'
require_relative 'pieces'

$game = Board.new
$game.updt_moves
$game.disp_board


5.times do 
	$game.turn_colour
	$game
	$game.make_move
	$game.disp_board
	$game.turns += 1
end
