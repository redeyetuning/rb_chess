require_relative 'board'
require_relative 'pieces'

$game = Board.new
$game.display_board

5.times do 
	$game.make_move
	$game.display_board
	$game.turns += 1
end
