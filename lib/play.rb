require_relative 'board'
require_relative 'pieces'

$game = Board.new
$act_board = $game
$game.updt_moves
$game.disp_board


20.times do 
	$game.turn_colour
	$game
	$game.make_move
	$game.turns += 1
end
