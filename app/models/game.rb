class Game

  attr_accessor :players, :card_stacks, :turn_count, :current_turn, :id

  def initialize(proposer)
    @players = []
    @card_stacks = {}
    @turn_count = 1
    @id = proposer.name
  end

  def accepted?
    @players.all?(&:accepted?)
  end

  def timed_out_players
    @players.select(&:pending?)
  end

  def current_player
    @players[(@turn_count - 1) % @players.count]
  end

  def kingdom_cards
    @card_stacks[:kingdom]
  end

end
