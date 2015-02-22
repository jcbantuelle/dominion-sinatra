class Turn

  attr_accessor :game, :actions, :buys, :coins, :potions, :phase

  def initialize(game)
    @game = game
    @actions = 1
    @buys = 1
    @coins = 0
    @potions = 0
    @phase = 'action'
  end
end
