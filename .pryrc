require_relative './lib/rulebook'
require_relative './lib/game'
require_relative './lib/console_interface'

rulebook = Rulebook.new
# board = Board.new({rulebook: rulebook})
# player_01 = Player.new({rulebook: rulebook, type: 'h', sign: '0', name: 'Batman'})
# player_02 = Player.new({rulebook: rulebook, sign: 'X', type: 'h', name: 'Superman'})
# game = Game.new({board: board, rulebook: rulebook, player_01: player_01, player_02: player_02, starting_player: 2})
console = ConsoleInterface.new({rulebook: rulebook})
