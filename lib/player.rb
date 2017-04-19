require_relative 'rulebook'

class Player
  attr_reader :name, :sign, :type, :rulebook

  def initialize(args)
    args.fetch(:name) == "" || args.fetch(:name).nil? ? @name = "Anon" : @name = args.fetch(:name)
    check_rulebook(args)
    @type = @rulebook.check_player_type(args)
    @sign = @rulebook.check_player_sign(args)
  end

  def check_rulebook(args)
    raise 'An actual rulebook is needed to start a game' unless args.fetch(:rulebook).is_a?(Rulebook)
    @rulebook = args.fetch(:rulebook)
  end
end
