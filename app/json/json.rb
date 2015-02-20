module Json

  def same_player?(player1, player2)
    player1.name == player2.name
  end

  def game_cards(game, type)
    turn = game.current_turn
    sort_cards(game, turn, game.send("#{type}_cards")).collect{ |card| card.json(game, turn) }
  end

  def sort_cards(game, turn, cards)
    turn = game.current_turn
    cards.sort{ |a, b| b.calculated_cost(game, turn)[:coin] <=> a.calculated_cost(game, turn)[:coin] }
  end

  def chat(player, message)
    {
      action: 'chat',
      message: "<strong>#{player.username}:</strong> #{message}"
    }.to_json
  end

end
