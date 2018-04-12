require_relative 'board'
require_relative 'pieces'

$game = Board.new
$game.disp_board

5.times do 
	$game
	$game.make_move
	$game.disp_board
	$game.turns += 1
end
