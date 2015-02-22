class VictoryCard < Card

  def starting_count
    @game.players.count < 3 ? 8 : 12
  end

end
