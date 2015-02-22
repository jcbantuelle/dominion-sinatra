class Curse < Card

  include BaseSet

  def starting_count
    @game.players.count > 1 ? (@game.players.count * 10) - 10 : 10
  end

  def base_cost
    {
      coin: 0
    }
  end

  def type
    [:curse]
  end

end
